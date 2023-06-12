//
//  FlashCardTVCell.swift
//  FireInspection
//
//  Created by Akanksha Trivedi on 21/03/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//

import UIKit

open class FlashCardTVCell: TableViewCell {
    
    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameSubLabel: UILabel!
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var separatorLabel: UILabel!
    @IBOutlet weak var selectButton: UIButton!

    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        self.nameSubLabel.isHidden = true
        self.titleImageView.isHidden = true
        self.separatorLabel.isHidden = true
        self.selectButton.isHidden = true
        self.contentView.frame.size.height = 60.0
    }
    
    open func setupUI() {
        self.cellContentView.borderColor = Colors.black231F20
        self.nameSubLabel.setFont(.m14)
        self.nameSubLabel.textColor = Colors.secondryGrey
        self.nameLabel.setFont(.h16)
    }
    
    open override func configure(_ item: Any?) {
        guard let model = item as? FlashCardTVCellModel else { return }
        self.nameLabel.text = model.title
        self.nameSubLabel.text = model.chapterName
        self.nameSubLabel.isHidden = model.cellType.displayLabel2
        self.titleImageView.isHidden = model.cellType.showTitleImage
        self.cellContentView.layer.borderWidth = model.cellType.borderWidth
        self.cellContentView.backgroundColor = model.cellType.bgColor
        self.separatorLabel.isHidden = model.cellType.showSeparatorLabel
        self.selectionStyle = .none
        
        self.selectButton.isHidden = model.isHidden
        self.selectButton.isSelected = model.isSelected
    }
    
}
