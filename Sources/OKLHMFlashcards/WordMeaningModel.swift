//
//  WordMeaningModel.swift
//  FireInspection
//
//  Created by Akanksha Trivedi on 22/03/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//

import Foundation

public class WordMeaningData {
    var wordMeaning: WordMeaningModel
    var chapterName: String
    var chapterNumber: String
    
    init(wordMeaning: WordMeaningModel, chapterName: String, chapterNumber: String) {
        self.wordMeaning = wordMeaning
        self.chapterName = chapterName
        self.chapterNumber = chapterNumber
    }
}

public class WordMeaningModel {
    var word: String
    var meaning: String
//    var chapterNumber: String
//    var chapterName: String
    
    init(word: String, meaning: String
//         ,chapterNumber: String, chapterName: String
    ) {
        self.word = word
        self.meaning = meaning
//        self.chapterNumber = chapterNumber
//        self.chapterName = chapterName
    }
}
