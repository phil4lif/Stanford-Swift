//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Phil Cowan on 10/27/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
