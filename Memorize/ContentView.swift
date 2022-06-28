//
//  ContentView.swift
//  Memorize
//
//  Created by Mykyta Havrylenko on 28.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["😂","😝","😁","😱","👉","🙌","🍻","🔥","🌈","🎈","🌹","💄","🎀","⚽","🎾","🏁","😡","👿","🐻","🐶","🐬"]
    
    @State var emojiCount = 5
    
    var body: some View {
        
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            
            Spacer()
            
            HStack {
                removeButton
                Spacer()
                addButton
            }
            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            .padding(.horizontal)
        }
        .padding(.horizontal)

    }
    
    var removeButton: some View {
        Button {
            if emojiCount > 1 { emojiCount -= 1 }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var addButton: some View {
        Button {
            if emojiCount < emojis.count { emojiCount += 1 }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
}


struct CardView: View {
    
    @State var isFaceUp = true
    var content: String
    
    var body: some View {
        
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            
            if isFaceUp {
                shape
                    .fill().foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .foregroundColor(.red)
            }
            
        }
        
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
