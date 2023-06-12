//
//  FlashCardWordMeaningModel.swift
//  FireInspection
//
//  Created by Nickelfox on 28/04/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//

import Foundation

protocol FlashCardWordMeaningModelProtocol: AnyObject {
    
}

public class FlashCardWordMeaningViewModel {
    
    weak var view: FlashCardWordMeaningModelProtocol!
    var chaptersWordsListArr = [WordMeaningData]()
    var cardType: FlashCardType = .keyTerm
    
    init(_ view: FlashCardWordMeaningModelProtocol,
         chapterWordMeanings: Any,
         cardType: FlashCardType) {
        self.view = view
        self.cardType = cardType
        if let chapterWordMeanings = chapterWordMeanings as? [WordMeaningData] {
            self.chaptersWordsListArr = chapterWordMeanings.shuffled()
        }
    }
    
    public func setupData() {
        dump(chaptersWordsListArr)
    }

}

extension FlashCardWordMeaningViewModel: FlashCardWordMeaningControllerProtocol {
    func wordMeaning(at index: Int) -> Any {
        return self.chaptersWordsListArr[index]
    }
    
    var cardsCount: Int {
        return self.chaptersWordsListArr.count
    }
    
    
}
