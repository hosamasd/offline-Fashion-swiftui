//
//  CartViewModel.swift
//  Fashion swiftui
//
//  Created by hosam on 1/3/21.
//

import SwiftUI

class CartViewModel: ObservableObject{
    
    // cart Items....
    @Published var isFavoritePressed:Bool = false
    @Published var isCheckoutPressed:Bool = false
    @Published var firstLoad = false
    @Published var items = [

    
        Item
    ]()
    
    @Published var checkoutItems:[Item] = [
//        Item(name: "Russ Shirt", details: "Light Red - L", image: "p4", price: 15.2, quantity: 1, offset: 0, isSwiped: false),
//        
//        Item(name: "Comfort Jacket", details: "Black - M", image: "p5", price: 29.02, quantity: 1, offset: 0, isSwiped: false),
//        Item(name: "Myrtle Beach Swetter", details: "White - M", image: "p2", price: 25.69, quantity: 2, offset: 0, isSwiped: false),
    ]
    
    @Published var favoritesItems:[Item] = [
//        Item(name: "Eywa Hoodie", details: "White - L", image: "p3", price: 22.99, quantity: 1, offset: 0, isSwiped: false),
//
//        Item(name: "Russ Shirt", details: "Light Red - L", image: "p4", price: 15.2, quantity: 1, offset: 0, isSwiped: false),
//
//        Item(name: "Comfort Jacket", details: "Black - M", image: "p5", price: 29.02, quantity: 1, offset: 0, isSwiped: false)
    ]

    init() {
        loadData()
    }
    
    func loadData () {
//        if !firstLoad{
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        self.firstLoad = true
        self.items = [
    
        Item(name: "Peace Skull Shirt", details: "Gray - L", image: "p1", price: 20.99, quantity: 1,
             offset: 0, isSwiped: false),
        Item(name: "Myrtle Beach Swetter", details: "White - M", image: "p2", price: 25.69, quantity: 2, offset: 0, isSwiped: false),
        
        Item(name: "Eywa Hoodie", details: "White - L", image: "p3", price: 22.99, quantity: 1, offset: 0, isSwiped: false),
        
        Item(name: "Russ Shirt", details: "Light Red - L", image: "p4", price: 15.2, quantity: 1, offset: 0, isSwiped: false),
        
        Item(name: "Comfort Jacket", details: "Black - M", image: "p5", price: 29.02, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Myrtle Beach Swetter", details: "White - M", image: "p2", price: 25.69, quantity: 2, offset: 0, isSwiped: false),
    ]
        
        
        
    }
//        }
    }
    
    
    func addFavorite(item:Item)  {
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(Animation.linear){
                
                if self.favoritesItems.contains(where: {$0.id==item.id
                }) {
                    self.favoritesItems.removeAll(where: {$0.id==item.id})
                }else {
                    self.favoritesItems.append(item)
                }
            
        }
    }
    
    func addCheckout(item:Item)  {
        
            withAnimation(Animation.linear){
                if self.checkoutItems.contains(where: {$0.id==item.id
                }) {
                    self.checkoutItems.removeAll(where: {$0.id==item.id})
                }else {
                    self.checkoutItems.append(item)
                }
               
            
        }
    }
}
