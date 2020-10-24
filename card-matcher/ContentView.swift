//
//  ContentView.swift
//  card-matcher
//
//  Created by Miguel Victor on 10/24/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = CardMatcherVM()
    
    var body: some View {
        VStack {
            ForEach(0..<vm.rows) { r in
                HStack {
                    ForEach(0..<vm.cols) { c in
                        CardView(card: vm.card(at: r * vm.cols + c))
                            .onTapGesture {
                                vm.choose(at: r * vm.cols + c)
                            }
                    }
                }
            }
        }
        .padding()
    }
}

struct CardView: View {
    let card: CardMatcherModel.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp || card.isMatched {
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10)
            }
        }
        .foregroundColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
