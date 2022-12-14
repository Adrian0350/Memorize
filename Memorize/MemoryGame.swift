// – Model –
//  MemoryGame.swift
//  Memorize
//
//  Created by Jaime Zúñiga on 24/09/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }

    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        let id: Int
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        // Add numberOfPairsOfCards x 2 to cards array
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)

            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    mutating func choose(_ card: Card) {
        
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),  !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
