//
//  ViewModel.swift
//  card-matcher
//
//  Created by Miguel Victor on 10/24/20.
//

import Foundation

class CardMatcherVM: ObservableObject {
    @Published private var model = CardMatcherModel()
    
    let rows = 6
    let cols = 4
    
    func card(at index: Int) -> CardMatcherModel.Card {
        let cardIndex = model.shuffledIndices[index]
        return model.cards[cardIndex]
    }
    
    func choose(at index: Int) {
        let cardIndex = model.shuffledIndices[index]
        model.choose(at: cardIndex)
    }
}
