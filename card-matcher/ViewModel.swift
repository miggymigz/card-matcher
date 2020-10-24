//
//  ViewModel.swift
//  card-matcher
//
//  Created by Miguel Victor on 10/24/20.
//

import Foundation

class CardMatcherVM {
    private var model = CardMatcherModel()
    
    let rows = 6
    let cols = 4
    
    func card(at index: Int) -> CardMatcherModel.Card {
        let randomIndex = model.shuffledIndices[index]
        return model.cards[randomIndex]
    }
}
