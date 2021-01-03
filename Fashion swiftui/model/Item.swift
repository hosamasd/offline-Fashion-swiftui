//
//  Item.swift
//  Fashion swiftui
//
//  Created by hosam on 1/3/21.
//

import SwiftUI

struct Item : Identifiable{
    
    var id = UUID().uuidString
    var name : String
    var details : String
    var image: String
    var price: Float
    var quantity: Int
    var offset: CGFloat
    var isSwiped: Bool
}
