//
//  ContentView.swift
//  Lecture1
//
//  Created by Sunwoo on 2022/07/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        return ZStack(content: {
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(lineWidth: 3)
            
            Text("Hello, world!").foregroundColor(Color.orange)
        })
        .padding(.horizontal)
        .foregroundColor(.red)
  
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
