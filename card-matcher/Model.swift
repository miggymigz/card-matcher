//
//  Model.swift
//  card-matcher
//
//  Created by Miguel Victor on 10/24/20.
//

import Foundation

struct CardMatcherModel {
    private let flags = ["🇵🇭", "🇸🇬", "🇹🇭", "🇰🇭", "🇮🇩", "🇵🇱", "🇺🇸", "🇱🇦", "🇨🇳", "🇧🇳", "🇰🇷", "🇨🇦"]
    private(set) var cards: [Card]
    public let shuffledIndices: [Int]
    
    init() {
        cards = []
        for i in 0..<flags.count {
            let flag = flags[i]
            
            // for each flag, 2 cards are created
            // since the user will want to match these cards
            cards.append(Card(id: i*2, content: flag))
            cards.append(Card(id: i*2+1, content: flag))
        }
        
        // we shuffle the indices of the cards
        // so that the cards appear random on the view
        shuffledIndices = flags.getShuffledIndices()
    }

    struct Card: Identifiable {
        var id: Int
        var content: String
    }
}

