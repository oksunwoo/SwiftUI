//
//  EmojiMemoryGame.swift
//  Lecture1
//
//  Created by Sunwoo on 2022/07/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    static var themes: Array<Theme> = [
        Theme(name: "vehicles",
              emojis: ["🚂","🚘", "🛵", "🛸", "🛴", "🚍", "🚛", "🚞", "🚁", "🚔", "🛺", "🚐", "🚒", "🚑" ,"🚜"," 🐸", "🐛", "🦋", "🚖", "🚝", "🚡"],
              pairCards: 10,
              color: "red"),
        Theme(name: "sports",
              emojis: ["⚽️", "🏀", "🏈", "🥎", "⚾️", "🏓", "🤿", "🥊", "🏹", "🪀", "⛳️", "🎱", "🪃", "🏸", "🏒"],
              pairCards: 8,
              color: "yellow"),
        Theme(name: "flags",
              emojis: ["🇬🇭", "🇬🇦", "🇬🇾", "🇬🇲", "🇬🇬", "🇬🇺", "🇬🇹", "🇰🇷", "🇳🇪", "🇱🇷", "🇺🇸", "🇧🇩" , "🇲🇾", "🇸🇧", "🏴󠁧󠁢󠁥󠁮󠁧󠁿"],
              pairCards: 6,
              color: "blue"),
        Theme(name: "plants",
              emojis: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈", "🍒", "🫐", "🍑", "🥭", "🍍", "🥥", "🥝", "🍅"],
              pairCards: 8,
              color: "green")
    ]
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: theme.pairCards) { pairIndex in
            theme.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String>
    private var theme: Theme
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var themeName: String {
        return theme.name
    }
    
    var cardColor: Color {
        switch theme.color {
        case "red" :
            return .red
        case "green":
            return .green
        case "yellow":
            return .yellow
        case "blue":
            return .blue
        default:
            return .black
        }
    }
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        //objectWillChange.send()
        model.choose(card)
    }
    
    func newGame() {
        guard let randomEmoji = EmojiMemoryGame.themes.randomElement() else {
            return
        }
        
        theme = randomEmoji
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
