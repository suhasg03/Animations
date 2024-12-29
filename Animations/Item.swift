//
//  Item.swift
//  Animations
//
//  Created by Suhas G on 29/12/24.
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
