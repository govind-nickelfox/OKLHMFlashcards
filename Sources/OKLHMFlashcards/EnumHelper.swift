//
//  EnumHelper.swift
//  Model
//
//  Created by Navpreet Kailay Work on 06/07/22.
//  Copyright © 2022 Nickelfox. All rights reserved.
//

import Foundation
import UIKit

enum ListType {
    case examPrep
    case reports
    case studyDeckList
}

enum Settings {
    case examPrep
    case audio
    
    static func getSettings(forModule: Settings) -> [String] {
        
        switch forModule {
        case .examPrep:
            return  ["Clear test results", "Clear Study deck"]
        case .audio:
            return  ["Download All", "Delete All"]
        }
    }
}

enum Option {
    case delete
    case download
}

enum Queue {
    
    case add
    case remove
}

enum AudioPlayerAction {
    case next
    case previous
}

enum ShowButton {
    case download
    case delete
    case cancel
    case buy
}

enum NavigationType {
    case practiceExamLevelI
    case practiceExamLevelII
    case practiceExamBothLevels
    case studyDeckLevelI
    case studyDeckLevelII
    case studyDeckBothLevels
    
    var typeTitle: String {
//        return self == .studyDeck ? "Study Deck" : "Practice Exam"
        switch self {
        case .practiceExamLevelI:
            return "Practice Exam"
        case .practiceExamLevelII:
            return "Practice Exam"
        case .practiceExamBothLevels:
            return "Practice Exam"
        case .studyDeckLevelI:
            return "Study Deck"
        case .studyDeckLevelII:
            return "Study Deck"
        case .studyDeckBothLevels:
            return "Study Deck"
        }
    }
}

enum IdentifyNextQuestionCellButtonType {
    case next
    case skip
}

enum ChapterLevels {
    case levelI
    case levelII
    case both
    
    var typeTitle: String {
        switch self {
        case .levelI:
           return "I"
        case .levelII:
            return "II"
        case .both:
            return "Both"
        }
    }
}

enum ChapterCategory {
    case I
    case II
    case both
    
    var description : String {
        switch self {
        case .I: return "chapter"
        case .II: return "chaptersII"
        case .both: return "chaptersBoth"
        }
      }
    
}

enum IdentifyStartButton {
    case begin
    case reset
    
    var title: String {
        switch self {
        case .begin:
            return "Let's Begin"
        case .reset:
            return "Reset Progress"
        }
    }
}

enum IdentifyModuleProgress {
    case completed
    case notCompleted
    case progress
}

enum VideoType {
    case parent
    case subVideo
}

enum VideoPlayMode: String {
    case offline = "Offline"
    case online = "Online"
}

enum QuestionType: String {
    case attempted = "ATTEMPTED"
    case unattempted = "UNATTEMPTED"
}

enum SubModule {
    case examPrep, flashcard
    
    var tabIndex: Int {
        switch self {
        case .examPrep: return TabBarItems.examPrep.rawValue
       case .flashcard: return TabBarItems.flashcard.rawValue
        }
    }
    
    var title: String {
        switch self {
        case .examPrep:
            return "ExamPrep"
        case .flashcard:
            return "Flashcard"
        }
    }
    var iconName: String {
        switch self {
        case .examPrep:
            return "exam_prep"
       case .flashcard:
            return "flash_card"
        }
    }
    
    var description: String {
        switch self {
        case .examPrep:
            return """
Use the 502 Exam Prep questions to confirm your understanding of the content in the Chief Officer, 4th Edition manual.
"""
         case .flashcard:
            return ""
        }
    }
}

enum TabBarItems: Int {
    case flashcard
    case home
    case examPrep
}


public enum FlashCard {
    case flashcardChapter
    case flashcardAlphabet
    case flashcardWord
    
    var showTitleImage: Bool {
        switch self {
        case .flashcardChapter:
            return false
        case .flashcardAlphabet, .flashcardWord:
            return true
        }
    }
    
    var showSeparatorLabel: Bool {
        switch self {
        case .flashcardChapter, .flashcardAlphabet:
            return false
        case .flashcardWord:
            return true
        }
    }
    
    var borderWidth: Double {
        switch self {
        case .flashcardChapter, .flashcardAlphabet:
            return 0.0
        case .flashcardWord:
            return 1.0
        }
    }
    
    var bgColor: UIColor {
        switch self {
        case .flashcardChapter, .flashcardAlphabet:
            return Colors.black231F20
        case .flashcardWord:
            return Colors.grey636466
        }
    }
    
    var displayDropDownButton: Bool {
        switch self {
        case .flashcardChapter, .flashcardWord:
            return true
        case .flashcardAlphabet:
            return false
        }
    }
    
    var displayLabel2: Bool {
        switch self {
        case .flashcardChapter:
            return false
        case .flashcardAlphabet, .flashcardWord:
            return true
        }
    }
}
