//
//  Item.swift
//  FrasesMotivacionales
//
//  Created by Manuel Alejandro Hernandez Marín on 06/04/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
