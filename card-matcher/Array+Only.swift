//
//  Array+Only.swift
//  card-matcher
//
//  Created by Miguel Victor on 10/24/20.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
