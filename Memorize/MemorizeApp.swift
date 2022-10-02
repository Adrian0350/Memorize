//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jaime Zúñiga on 21/09/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    // Using let because EmojiMemoryGame is a class so I want a constant pointer type var for that class
    // so the class morfing is no issue here.
    let game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
