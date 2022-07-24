//
//  ContentView.swift
//  Lecture1
//
//  Created by Sunwoo on 2022/07/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            ScrollView{
                Text("Memorize")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(, id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            VStack {
                HStack {
                    vehicles
                    Spacer()
                    sports
                    Spacer()
                    flags
                }
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var vehicles : some View {
        Button {
            emojis = ["🚂","🚘", "🛵", "🛸", "🛴", "🚍", "🚛", "🚞", "🚁", "🚔", "🛺", "🚐", "🚒", "🚑" ,"🚜"," 🐸", "🐛", "🦋", "🚖", "🚝", "🚡"]
        } label: {
            VStack {
                Image(systemName: "car")
                Text("Vehicles").font(.body)
            }
        }
    }
    
    var sports : some View {
        Button {
            emojis = ["⚽️", "🏀", "🏈", "🥎", "⚾️", "🏓", "🤿", "🥊", "🏹", "🪀", "⛳️", "🎱", "🪃", "🏸", "🏒"]
        } label: {
            VStack {
                Image(systemName: "sportscourt")
                Text("Sports").font(.body)
            }
        }
    }
    
    var flags : some View {
        Button {
            emojis = ["🇬🇭", "🇬🇦", "🇬🇾", "🇬🇲", "🇬🇬", "🇬🇺", "🇬🇹", "🇰🇷", "🇳🇪", "🇱🇷", "🇺🇸", "🇧🇩" , "🇲🇾", "🇸🇧", "🏴󠁧󠁢󠁥󠁮󠁧󠁿"]
        } label: {
            VStack {
                Image(systemName: "flag")
                Text("Flags").font(.body)
            }
        }
    }
    
    var remove : some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add : some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View {
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUP {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
