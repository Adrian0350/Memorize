// – Model –
//  MemoryGame.swift
//  Memorize
//
//  Created by Jaime Zúñiga on 24/09/22.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>

    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        // Add numberOfPairsOfCards x 2 to cards array
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)

            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        
        cards[chosenIndex].isFaceUp.toggle()
        print("\(cards)")
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }

        return 0
    }
}
