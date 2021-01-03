//
//  HomeFavorite.swift
//  Fashion swiftui
//
//  Created by hosam on 1/3/21.
//

import SwiftUI

struct HomeFavorite: View {
    
    @StateObject var vm = CartViewModel()
    @State var items = Array(repeating: GridItem(spacing:15), count: 2)
    @State var link = ""
    @State var show = false
    var topHeight:CGFloat = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 40
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Spacer()
                
                Text("My Favorites")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Spacer()
                
                Button(action: {
//                        withAnimation{
                        if items.count == 2 {items.removeLast()}
                        else {items.append(GridItem(spacing:15))}
//                        }
                })  {
                    
                    Image(systemName: items.count != 2  ? "square.grid.2x2.fill" : "rectangle.grid.2x2.fill")
                        .font(.system(size:22))
                        .foregroundColor(.black)
                }
            }
            .padding()
            .padding(.top,topHeight-20)
            
            
            VStack {
                if !vm.favoritesItems.isEmpty {
                    ScrollView {
                        LazyVGrid(columns: items) {
                            ForEach(vm.favoritesItems) {card in
                                FavoriteItemView(car: card, items: $items)
                                //                                CardView(car: card, items: $items)
                                
                            }
                        }
                        .padding()
                    }
                }else {
                    ScrollView {
                    Text("no favorite added yet.....")
                    }
                }
            }
        }
//        .background(Color.primary.opacity(0.05))
    }
}

struct HomeFavorite_Previews: PreviewProvider {
    static var previews: some View {
        HomeFavorite()
    }
}
