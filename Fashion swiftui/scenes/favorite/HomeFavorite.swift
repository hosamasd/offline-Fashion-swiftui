//
//  HomeFavorite.swift
//  Fashion swiftui
//
//  Created by hosam on 1/3/21.
//

import SwiftUI

struct HomeFavorite: View {
    
    @EnvironmentObject var vm: CartViewModel
    @State var items = Array(repeating: GridItem(spacing:15), count: 2)
    @State var link = ""
    @State var show = false
    var topHeight:CGFloat = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 40
    @State var showAlert = false
    @State var selectedItem: Item = Item(name: "Comfort Jacket", details: "Black - M", image: "p5", price: 29.02, quantity: 1, offset: 0, isSwiped: false)
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
                                    .onTapGesture(perform: {
                                        self.showAlert.toggle()
                                        self.selectedItem=card
                                    })
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
        // Alert View...
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Alert"), message: Text("Choose your action"), primaryButton: .destructive(Text("Delete"), action: {
                // Do Some Code Here...
                vm.favoritesItems.removeAll(where: {$0.id==selectedItem.id})
            }), secondaryButton: .default(Text("Cancel"), action: {
                // Do Some Code Here...
            }))
        })
//        .background(Color.primary.opacity(0.05))
    }
}

struct HomeFavorite_Previews: PreviewProvider {
    static var previews: some View {
        HomeFavorite()
    }
}
