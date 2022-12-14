// β ViewModel β
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jaime ZΓΊΓ±iga on 24/09/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    static let emojis =  [
        "π€‘", "β οΈ", "π", "πΉ", "πΊ", "π€", "πΈ", "π»", "π½",
        "π¦΅", "π¦Ώ", "π¦Ά", "π£", "π", "π¦»",  "π«", "π«", "π§ ",
        "π¦·", "π¦΄", "π", "π", "π", "π", "π", "π©Έ",  "πͺπ½",
    ]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 27) { pairIndex in
            emojis[pairIndex]
        }
    }

    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
