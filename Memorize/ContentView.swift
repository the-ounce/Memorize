//
//  ContentView.swift
//  Memorize
//
//  Created by Mykyta Havrylenko on 28.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = [
        "Vehicles": ["🚗", "🚕", "🚙", "🚌", "🚒", "🛺", "🚔", "🚝", "🚁", "🛻", "🚚", "🚛"],
        "Flags": ["🇺🇦", "🇺🇸", "🇬🇧", "🇨🇭", "🇸🇪", "🇿🇦", "🇮🇪", "🇩🇪", "🇨🇿", "🇦🇹", "🇵🇱", "🇱🇹", "🇮🇸", "🇪🇪"],
        "Food": ["🍎", "🍓", "🍊", "🥐", "🥞", "🍔", "🍤", "🥟", "🥗", "🍮", "🍩", "🍕", "🥕"]
    ]
    
    
    @State var chosenTheme = "Vehicles"
    
    var body: some View {
        
        VStack {
            
            let currentTheme = emojis[chosenTheme]!.shuffled()
            let randomRange = 0...Int.random(in: 3...currentTheme.count - 1)
            
            let cardCount = randomRange.count
            let scale = widthThatBestFits(cardCount)
            
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: scale))]) {
                    ForEach(currentTheme[randomRange], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            
            Spacer()
            
            HStack {
                vehicleThemeButton
                Spacer()
                flagsThemeButton
                Spacer()
                foodThemeButton
            }
            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            .padding(.horizontal)
            .foregroundColor(.blue)
        }
        .padding(.horizontal)
        
    }
    
    
    var vehicleThemeButton: some View {
        Button {
            chosenTheme = "Vehicles"
        } label: {
            VStack {
                Image(systemName: "car.circle")
                Text("Vehicles")
                    .font(.callout)
            }
            .frame(width: 80, height: 80)
        }
        
    }
    
    var flagsThemeButton: some View {
        Button {
            chosenTheme = "Flags"
        } label: {
            VStack {
                Image(systemName: "flag.circle")
                Text("Flags")
                    .font(.callout)
            }
            .frame(width: 80, height: 80)
        }
        
    }
    
    var foodThemeButton: some View {
        Button {
            chosenTheme = "Food"
        } label: {
            VStack {
                Image(systemName: "fork.knife.circle")
                Text("Food")
                    .font(.callout)
            }
            .frame(width: 80, height: 80)
        }
    }
    
    
}

func widthThatBestFits(_ cardCount: Int) -> CGFloat {
    var scale: Int {
        switch cardCount {
        case 4: return 120
        case 5: return 100
        case 6...8: return 85
        case 9...15: return 75
        case 16...25: return 65
        default: return 65
        }
    }
    
    return CGFloat(scale)
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
