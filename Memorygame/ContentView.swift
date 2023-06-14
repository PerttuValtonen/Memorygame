//
//  ContentView.swift
//  Memorygame
//
//  Created by Perttu Valtonen on 12.6.2023.
//

import SwiftUI

struct ContentView: View {
    
    private var fourColumnGrid = [GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible())]
    
    @State var cards = createCardList().shuffled()
    @State var MatchedCards = [Card]()
    @State var UserChoices = [Card]()
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("background-cloth")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Text("Memory Game")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    LazyVGrid(columns: fourColumnGrid) {
                        ForEach(cards) { card in
                            CardView(card: card,
                                     MatchedCards: $MatchedCards,
                                     UserChoices: $UserChoices)
                        }
                    }
                    .padding()
                    
                    Text("Match cards to win")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
