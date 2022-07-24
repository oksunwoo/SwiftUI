//
//  Lecture1App.swift
//  Lecture1
//
//  Created by Sunwoo on 2022/07/19.
//

import SwiftUI

@main
struct Lecture1App: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
