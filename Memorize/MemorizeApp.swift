//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Sergey Maslennikov on 23.11.2020.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}
