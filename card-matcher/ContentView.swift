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
        Grid(rows: vm.rows, cols: vm.cols) { i in
            CardView(card: vm.card(at: i))
                .onTapGesture {
                    vm.choose(at: i)
                }
        }
        .padding()
    }
}

struct Grid<ItemView>: View where ItemView: View {
    let rows: Int
    let cols: Int
    let builder: (Int) -> ItemView
    
    var body: some View {
        VStack {
            ForEach(0..<rows) { r in
                HStack {
                    ForEach(0..<cols) { c in
                        builder(r * cols + c)
                    }
                }
            }
        }
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
