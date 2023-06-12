//
//  FlashCardCellModel.swift
//  FireInspection
//
//  Created by Akanksha Trivedi on 17/03/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//

import Foundation

public class FlashCardTVCellModel {
    public var id: Int
    public var title: String
    public var chapterName: String
    public var actualMeaning = ""
    public var isHidden: Bool = true
    public var isSelected = false {
        didSet {
            self.updateHideState()
        }
    }
    public var cellType: FlashCard
    public var childIndexPaths: [IndexPath] = []
    public var identifier = "\(UUID())"
    public var areChildrenExpanded = false
    
    public var parentIdentifier = ""
    public var grandParentIdentifier = ""
    public var selectionType: ExamPrepButtonType
    
    init(id: Int,
         title: String,
         chapter: String,
         isSelected: Bool,
         selectionType: ExamPrepButtonType) {
        self.id = id
        self.title = title
        self.chapterName = chapter
        self.cellType = .flashcardChapter
        self.isSelected = isSelected
        self.selectionType = selectionType
    }
    
    public func updateHideState() {
        if self.selectionType == .enableSelection {
            self.isHidden = false
        } else {
            self.isHidden = !isSelected
        }
    }

}
