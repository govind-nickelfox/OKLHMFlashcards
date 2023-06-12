//
//  FlashCardWordMeaningController.swift
//  FireInspection
//
//  Created by Nickelfox on 27/04/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//

import Foundation
import UIKit
import FLUtilities

protocol FlashCardWordMeaningControllerDataProtocol: AnyObject {
    func updateFlashCard(to type: FlashCardType)
}

protocol FlashCardWordMeaningControllerProtocol: AnyObject {
    func setupData()
    var cardsCount: Int { get }
    func wordMeaning(at index: Int) -> Any
    var cardType: FlashCardType { get set }
}

open class FlashCardWordMeaningController: UIViewController {
    
    static var newInstance: FlashCardWordMeaningController? {
        let sb = UIStoryboard.init(name: Storyboard.flashcard.name,
                                   bundle: nil)
        return sb.instantiateViewController(withIdentifier: self.className()) as? FlashCardWordMeaningController
    }
    
    var viewModel: FlashCardWordMeaningControllerProtocol!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var flashCardsWordsToggleButton: UIButton!
    @IBOutlet weak var wordsTitleLabel: UILabel!
    
    open var swipeableView: ZLSwipeableView!
    
    open var viewIndex = 0
    open var loadCardsFromXib = false
    weak var delegate: FlashCardWordMeaningControllerDataProtocol?
    open var flashCardLoaded: Bool = false
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        swipeableView.nextView = {
            return self.nextCardView()
        }
    }
    
    open override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        super.didRotate(from: fromInterfaceOrientation)
        for subview in self.view.subviews where subview is ZLSwipeableView {
            subview.removeFromSuperview()
        }
        self.initialSetup()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    open func initialSetup() {
        self.viewModel.setupData()
        self.setupSwipableView()
        self.setToggleStatus(.keyTerm)
        self.wordsTitleLabel.setFont(.h24)
    }
    
    open func setupSwipableView() {
        view.clipsToBounds = true
        swipeableView = ZLSwipeableView()
        view.addSubview(swipeableView)
        swipeableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                swipeableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
                swipeableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
                swipeableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
                swipeableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
            ])
        
        swipeableView.allowedDirection = [Direction.Left, Direction.Right]

        self.swipeableView.didSwipe = { _, direction, _ in
            if direction == .Right {
                self.swipeableView.rewind()
                self.swipeableView.rewind()
            }
        }
    }
    
    open func setupViewModel(chapterWordMeanings: Any, cardType: FlashCardType) {
        if self.viewModel == nil {
            self.viewModel = FlashCardWordMeaningViewModel(self,
                                                           chapterWordMeanings: chapterWordMeanings,
                                                           cardType: cardType)
        }
    }
    
    
    open func nextCardView() -> UIView? {
        if viewIndex >= self.viewModel.cardsCount {
            viewIndex = 0
        }
        
        let hidePreviousButton = viewIndex == 0 && !flashCardLoaded
        let cardView = FlashCardView(frame: swipeableView.bounds,
                                     wordMeaning: self.viewModel.wordMeaning(at: viewIndex),
                                     cardType: self.viewModel.cardType,
                                     hidePreviousButton: hidePreviousButton)
        cardView.delegate = self
        viewIndex += 1

        if loadCardsFromXib {
            if let contentView = Bundle.main.loadNibNamed("FlashCardView",
                                                          owner: self,
                                                          options: nil)?.first as? UIView {
                contentView.translatesAutoresizingMaskIntoConstraints = false
                contentView.backgroundColor = cardView.backgroundColor
                cardView.addSubview(contentView)
                
            }
            
        }
        self.flashCardLoaded = true
        return cardView
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func flashCardsWordsToggleButtonAction(_ sender: UIButton) {
        self.viewModel.cardType = self.viewModel.cardType == .keyTerm ? .definition : .keyTerm
        self.setToggleStatus(self.viewModel.cardType)
        self.delegate?.updateFlashCard(to: self.viewModel.cardType)
    }
    
    open func setToggleStatus(_ type: FlashCardType) {
        self.wordsTitleLabel.text = self.viewModel.cardType.rawValue
        self.flashCardLoaded = false
        self.viewIndex = 0
        self.swipeableView.removeFromSuperview()
        self.setupSwipableView()
    }
    
}

extension FlashCardWordMeaningController: CustomViewProtocol {
    open func didTapNextButton() {
        swipeableView.swipeTopView(inDirection: .Left)
    }
    
    open func didTapPreviousButton() {
        swipeableView.rewind()
    }
}

extension FlashCardWordMeaningController: FlashCardWordMeaningModelProtocol {
    
}
