//
//  ContentView.swift
//  card-matcher
//
//  Created by Miguel Victor on 10/24/20.
//

import SwiftUI

struct ContentView: View {
    let vm = CardMatcherVM()
    
    var body: some View {
        VStack {
            ForEach(0..<vm.rows) { r in
                HStack {
                    ForEach(0..<vm.cols) { c in
                        CardView(content: vm.card(at: r * vm.cols + c).content)
                    }
                }
            }
        }
        .padding()
    }
}

struct CardView: View {
    let content: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
            Text(content).font(.largeTitle)

        }
        .foregroundColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
