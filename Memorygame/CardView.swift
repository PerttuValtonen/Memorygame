//
//  CardView.swift
//  Memorygame
//
//  Created by Perttu Valtonen on 12.6.2023.
//

import SwiftUI

struct CardView: View {
    
    @ObservedObject var card: Card
    
    @Binding var MatchedCards: [Card]
    @Binding var UserChoices: [Card]
    
    var body: some View {
        if card.isFaceUp || MatchedCards.contains(where: {$0.id == card.id}) {
            Image("card\(card.text)")
                .resizable()
        } else {
            Image("card0")
                .resizable()
                .onTapGesture {
                    if UserChoices.count == 0 {
                        card.turnOver()
                        UserChoices.append(card)
                    } else if UserChoices.count == 1 {
                        card.turnOver()
                        UserChoices.append(card)
                        withAnimation(Animation.linear.delay(1)) {
                            for thisCard in UserChoices {
                                thisCard.turnOver()
                            }
                        }
                        checkForMatch()
                    }
                }
        }
    }
    
    func checkForMatch() {
        if UserChoices[0].text == UserChoices[1].text {
            MatchedCards.append(UserChoices[0])
            MatchedCards.append(UserChoices[1])
        }
        UserChoices.removeAll()
    }
}
