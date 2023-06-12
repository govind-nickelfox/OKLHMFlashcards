//
//  NewView.swift
//  VC_Over_View
//
//  Created by Nickelfox on 25/04/23.
//

import Foundation
import UIKit
import FLUtilities

public protocol CustomViewProtocol: AnyObject {
    func didTapNextButton()
    func didTapPreviousButton()
}

public let innerViewHeight: CGFloat = 140
public let revealButtonHeight: CGFloat = 48
public let revealButtonMaxHeight: CGFloat = 55
public let revealButtonMaxHeightOffSet: CGFloat = 30

public let iPhone8PlusHeight: CGFloat = 736
public let chapterNameLabelMaxWidth: CGFloat = 220

public class FlashCardView: UIView {
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var meaningTextView: UITextView!
    @IBOutlet weak var hideMeaningButton: UIButton!
    @IBOutlet weak var wordView: UIView!
    @IBOutlet weak var meaningView: UIView!
    @IBOutlet weak var revealButtonView: UIView!
    @IBOutlet weak var chapterView: UIView!
    @IBOutlet weak var chapterNumber: UILabel!
    @IBOutlet weak var chapterName: UILabel!
    @IBOutlet weak var revealButton: UIButton!
    @IBOutlet weak var hideWordButton: UIButton!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var revealButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var hideButtonView: UIView!
    @IBOutlet weak var outerView: UIView!
    
    public weak var delegate: CustomViewProtocol?
    
    public var wordMeaning: WordMeaningData?
    public var cardType: FlashCardType
    
    public required init(frame: CGRect,
                  wordMeaning: Any,
                  cardType: FlashCardType,
                  hidePreviousButton: Bool) {
        if let wordMeaning = wordMeaning as? WordMeaningData {
            self.wordMeaning = wordMeaning
        }
        self.cardType = cardType
        super.init(frame: frame)
        
        self.commonInit()
        self.meaningView.cornerRadius = 8
        self.meaningView.borderWidth = 1
        self.meaningView.borderColor = Colors.black231F20
        self.innerView.cornerRadius = 8
        self.hideMeaningButton.cornerRadius = 25
        self.revealButton.cornerRadius = 25
        
        setup()
        
        self.chapterNumber.setFont(.h14)
        self.chapterName.setFont(.p12)
        self.wordLabel.setFont(.p24)
        self.meaningTextView.setFont(.p14)
        self.hideWordButton.setFont(.h14)
        self.revealButton.titleLabel?.numberOfLines = 0
        self.revealButton.titleLabel?.textAlignment = .center
        self.revealButton.titleLabel?.adjustsFontSizeToFitWidth = true
        self.updateRevelButton(isSelected: false)
        self.previousButton.isHidden = hidePreviousButton
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.chapterView.cornerRadius = 16
        self.chapterView.borderWidth = 1
    }
    
    public func commonInit() {
        let bundle = Bundle.init(for: FlashCardView.self)
        if let viewToAdd = bundle.loadNibNamed("FlashCardView",
                                               owner: self,
                                               options: nil),
            let contentView = viewToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
    
    public func setup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 1.5)
        layer.shadowRadius = 4.0
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.cornerRadius = 12
        self.outerView.borderWidth = 1
        self.outerView.borderColor = Colors.offWhiteColor
        self.outerView.cornerRadius = 16
        self.hideMeaningButton.setFont(.h14)
        self.wordLabel.text = self.wordMeaning?.wordMeaning.word
        self.meaningTextView.text = self.wordMeaning?.wordMeaning.meaning
        self.chapterName.text = self.wordMeaning?.chapterName
         
        let chapterNameHeight = self.chapterName.bounds.height
        if UIDevice.current.userInterfaceIdiom == .phone,
           let width = self.chapterName.text?.width(
            withConstrainedHeight: chapterNameHeight,
            font: AppFont.getFont(fontType: .p12)) {
            self.chapterName.numberOfLines = width > chapterNameLabelMaxWidth ? 2 : 1
        }
        
        self.chapterNumber.text = self.wordMeaning?.chapterNumber
        self.wordView.isHidden = self.cardType == .keyTerm
        self.wordLabel.isHidden = self.cardType == .definition
        self.hideMeaningButton.isHidden = self.cardType == .definition
        self.revealButtonView.isHidden = self.cardType == .definition
        
        self.meaningTextView.text = self.wordMeaning?.wordMeaning.meaning
        self.wordLabel.text = self.wordMeaning?.wordMeaning.word
        switch self.cardType {
        case .keyTerm:
            self.meaningTextView.isHidden = true
        case .definition:
            self.meaningTextView.text = self.wordMeaning?.wordMeaning.meaning
            self.enableScroll(true)
        }
        
        revealButton.titleEdgeInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        wordView.addSubview(revealButton)
    }
    
    @IBAction func previousButtonAction(_ sender: UIButton) {
        self.delegate?.didTapPreviousButton()
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        self.delegate?.didTapNextButton()
    }
    
    @IBAction func hideMeaningButtonAction(_ sender: UIButton) {
        if sender.isSelected {
            self.hideMeaningButton.setFont(.h14)
        } else {
            self.hideMeaningButton.setFont(.p12)
        }
        
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            self.meaningTextView.isHidden = false
            self.meaningTextView.text = self.wordMeaning?.wordMeaning.meaning
            self.enableScroll(true)
        } else {
            self.meaningTextView.text = ""
            self.meaningTextView.isHidden = true
            self.enableScroll(false)
        }
    }
    
    @IBAction func revealButtonAction(_ sender: UIButton) {
        self.updateRevelButton(isSelected: !sender.isSelected)
    }
    
    @IBAction func hideWordButton(_ sender: UIButton) {
        self.updateRevelButton(isSelected: false)
    }
 
    public func updateRevelButton(isSelected: Bool) {
        func updateHeight(for text: String) {
            let height = max(text.height(withConstrainedWidth: self.revealButton.bounds.width,
                                         font: AppFont.getFont(fontType: .h14)),
                             revealButtonHeight)
            self.revealButtonHeightConstraint.constant = height
            if height > revealButtonMaxHeight {
                self.revealButtonHeightConstraint.constant += revealButtonMaxHeightOffSet
            }
        }
        
        self.hideButtonView.isHidden = !isSelected
        let text = isSelected ? self.wordMeaning?.wordMeaning.word ?? "" : "Reveal Word"
        let color = isSelected ? Colors.offWhiteColor : Colors.primaryColor
        updateHeight(for: text)
        self.revealButton.setTitle(text, for: .normal)
        self.revealButton.backgroundColor = color
    }
    
    public func enableScroll(_ enable: Bool) {
        if enable {
            delay(0.1) {
                // For smaller screens like iPhone8 and SE series, enabling scrolling
                let canEnableScrolling = UIScreen.main.bounds.height <= iPhone8PlusHeight
                self.meaningTextView.isScrollEnabled = canEnableScrolling
            }
        } else {
            self.meaningTextView.isScrollEnabled = enable
        }
    }
}
