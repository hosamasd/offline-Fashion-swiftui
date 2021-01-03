//
//  FavoriteItemView.swift
//  Fashion swiftui
//
//  Created by hosam on 1/3/21.
//

import SwiftUI

struct FavoriteItemView: View {
    
    var car :Item
    @Binding var items:[GridItem]
    
    var body: some View {
      
        VStack(spacing:15) {
            Image(car.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack(spacing:0) {
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text(car.name)
                        .fontWeight(.bold)
                    
                    Text(getPrice(value: car.price))
                        .font(.caption)
                }
                
                Spacer(minLength: 0)
            }
            
        }
        .frame(height: items.count == 2 ? (UIScreen.main.bounds.height - 50 ) / 2.5 : nil)
        .padding()
        .background(Color.primary.opacity(0.05))
        
    }
}
