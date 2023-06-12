//
//  ChapterHeaderCell.swift
//  IFSTA Companion App
//
//  Created by Mohit Kumar Singh on 09/05/22.
//  Copyright © 2022 AppCenter. All rights reserved.
//

import UIKit

public enum ExamPrepButtonType {
    case buy, select, selectAll, enableSelection
    
    var buttonTitle: String {
        switch self {
        case .buy: return " Buy All"
        case .select: return "Unselect All"
        case .selectAll: return "Select All"
        case .enableSelection: return "SelectAll"
        }
    }
}

protocol ChapterHeaderCellDelegate: AnyObject {
    func didTapButton(type: ExamPrepButtonType?)
}

final class ChapterHeaderCellModel {
    var totalCount: String
    var selectedCount: String
    var type: ExamPrepButtonType?
    
    init(totalCount: String, selectedCount: Int, type: ExamPrepButtonType?) {
        self.totalCount = totalCount
        self.selectedCount = selectedCount == 0 ? "" : "\(selectedCount) Selected"
        self.type = type
    }
}

class ChapterHeaderCell: TableViewCell {
    
    @IBOutlet weak var examCountLabel: UILabel!
    @IBOutlet weak var selectedCountLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func configure(_ item: Any?) {
        if let item = item as? ChapterHeaderCellModel {
            self.examCountLabel.text = item.totalCount
            self.selectedCountLabel.text = item.selectedCount
            self.actionButton.setTitle(item.type?.buttonTitle, for: .normal)
            
            switch item.type {
            case .buy:
                self.actionButton.setImage(UIImage(named: Images.All.buyAll.rawValue), for: .normal)
            case .select:
                self.actionButton.setImage(nil, for: .normal)
            case .selectAll:
                self.actionButton.setImage(nil, for: .normal)
            case .enableSelection:
                self.actionButton.setImage(nil, for: .normal)
            case .none:
                self.actionButton.setImage(nil, for: .normal)
                self.actionButton.setTitle("Select Exams", for: .normal)
            }
        }
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        if let item = item as? ChapterHeaderCellModel {
            if let delegate = self.delegate as? ChapterHeaderCellDelegate {
                delegate.didTapButton(type: item.type)
            }
        }
    }
}
