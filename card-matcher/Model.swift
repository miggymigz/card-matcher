//
//  Model.swift
//  card-matcher
//
//  Created by Miguel Victor on 10/24/20.
//

import Foundation

struct CardMatcherModel {
    // the cards shown in the game will show these flags
    private let flags = ["🇵🇭", "🇸🇬", "🇹🇭", "🇰🇭", "🇮🇩", "🇵🇱", "🇺🇸", "🇱🇦", "🇨🇳", "🇧🇳", "🇰🇷", "🇨🇦"]
    
    // the list of cards in the game
    private(set) var cards: [Card]
    
    // basically contains the indices of the cards
    // but they are shuffled for the consumer's convenience
    public let shuffledIndices: [Int]
    
    // computed property that keeps track of the current selected
    // card (if there's any)
    private var pastSelectedCardIndex: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp && !cards[$0].isMatched }.only
        }
    }
    
    // the indices of the cards that needs to be closed
    // for the next tap event
    private var cardIndicesToClose: [Int]?
    
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
    
    mutating func choose (at index: Int) {
        let chosenCard = cards[index]
        
        // do nothing when the chosen card is already faced up
        // or if the chosen card is already matched
        if chosenCard.isFaceUp || chosenCard.isMatched {
            return
        }
        
        // close cards that needs to be closed
        if let indicesToClose = cardIndicesToClose {
            for i in indicesToClose {
                cards[i].isFaceUp = false
            }
        }
        
        // if there is a past selected card,
        // then attempt to match that card with the current selected card
        if let potentialMatchIndex = pastSelectedCardIndex {
            // the currently chosen card matches with the last chosen card
            if cards[potentialMatchIndex].content == cards[index].content {
                cards[potentialMatchIndex].isMatched = true
                cards[index].isMatched = true
                cardIndicesToClose = nil
            }
            else {
                cards[index].isFaceUp = true
                cardIndicesToClose = [potentialMatchIndex, index]
            }
        } else {
            cards[index].isFaceUp = true
            cardIndicesToClose = nil
        }
    }

    struct Card: Identifiable {
        var id: Int
        var content: String
        var isFaceUp = false
        var isMatched = false
    }
}

