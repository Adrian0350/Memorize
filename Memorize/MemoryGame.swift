//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jaime Zúñiga on 24/09/22.
//

import Foundation

struct MemoryGame<CardContent> {
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }

    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        // Add numberOfPairsOfCards x 2 to cards array
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)

            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    func choose(_ card: Card) {
        
    }
}
