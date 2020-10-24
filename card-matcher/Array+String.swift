//
//  String+Utils.swift
//  card-matcher
//
//  Created by Miguel Victor on 10/24/20.
//

import Foundation

extension Array where Element == String {
    func getShuffledIndices(multiplier: Int = 2) -> [Int] {
        var indices = [Int](0..<self.count*2)
        indices.shuffle()
        return indices
    }
}
