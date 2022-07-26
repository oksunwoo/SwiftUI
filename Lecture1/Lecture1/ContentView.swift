//
//  ContentView.swift
//  Lecture1
//
//  Created by Sunwoo on 2022/07/19.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView{
            Text("Memorize")
                .font(.largeTitle)
                .foregroundColor(.white)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}


//var vehicles : some View {
//    Button {
//        emojis = ["🚂","🚘", "🛵", "🛸", "🛴", "🚍", "🚛", "🚞", "🚁", "🚔", "🛺", "🚐", "🚒", "🚑" ,"🚜"," 🐸", "🐛", "🦋", "🚖", "🚝", "🚡"]
//    } label: {
//        VStack {
//            Image(systemName: "car")
//            Text("Vehicles").font(.body)
//        }
//    }
//}
//
//var sports : some View {
//    Button {
//        emojis = ["⚽️", "🏀", "🏈", "🥎", "⚾️", "🏓", "🤿", "🥊", "🏹", "🪀", "⛳️", "🎱", "🪃", "🏸", "🏒"]
//    } label: {
//        VStack {
//            Image(systemName: "sportscourt")
//            Text("Sports").font(.body)
//        }
//    }
//}
//
//var flags : some View {
//    Button {
//        emojis = ["🇬🇭", "🇬🇦", "🇬🇾", "🇬🇲", "🇬🇬", "🇬🇺", "🇬🇹", "🇰🇷", "🇳🇪", "🇱🇷", "🇺🇸", "🇧🇩" , "🇲🇾", "🇸🇧", "🏴󠁧󠁢󠁥󠁮󠁧󠁿"]
//    } label: {
//        VStack {
//            Image(systemName: "flag")
//            Text("Flags").font(.body)
//        }
//    }
//}
//
//var remove : some View {
//    Button {
//        if emojiCount > 1 {
//            emojiCount -= 1
//        }
//    } label: {
//        Image(systemName: "minus.circle")
//    }
//}
//
//var add : some View {
//    Button {
//        if emojiCount < emojis.count {
//            emojiCount += 1
//        }
//    } label: {
//        Image(systemName: "plus.circle")
//    }
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
