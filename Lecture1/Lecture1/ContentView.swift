//
//  ContentView.swift
//  Lecture1
//
//  Created by Sunwoo on 2022/07/19.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚂","🚘", "🛵", "🛸", "🛴", "🚍", "🚛", "🚞", "📱", "⌚️", "💻", "🖥", "⚽️", "🏀", "🏈", "🥎", "⚾️", "🏓", "🤿", "🥊", "🎗", "🚁", "🚦"]
    @State var emogiCount = 4
    
    var body: some View {
        VStack{
            HStack{
                ForEach(emojis[0..<emogiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var remove : some View {
        Button {
            if emogiCount > 1 {
                emogiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add : some View {
        Button {
            if emogiCount < emojis.count {
                emogiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUP = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUP {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .stroke(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUP = !isFaceUP
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
