//
//  Theme.swift
//  Lecture1
//
//  Created by Sunwoo on 2022/07/26.
//

import Foundation

struct Theme {
    var name: String
    var emojis: Array<String>
    var pairCards: Int
    var color: String
    
    init(name: String, emojis: Array<String>, pairCards: Int, color: String) {
        self.name = name
        self.emojis = emojis
        self.pairCards = pairCards > emojis.count ? emojis.count : pairCards
        self.color = color
    }
}
