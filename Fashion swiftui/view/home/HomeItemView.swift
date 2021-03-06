//
//  HomeItemView.swift
//  Fashion swiftui
//
//  Created by hosam on 1/3/21.
//

import SwiftUI

struct HomeItemView: View {
   
    var car :Item
    @Binding var items:[GridItem]
//    @StateObject var cartVM = CartViewModel()
    @EnvironmentObject var cartVM: CartViewModel
    @AppStorage("favorite") var isFavorite = false
    @AppStorage("checkout") var isCheckout = false
    
    var body: some View {
        
        VStack(alignment: .leading,spacing: 10){
            
            ZStack{
                
                BlurView(style: .regular)
                
                Image(car.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack{
                    
                    HStack{
                        
                        
                        Button(action:
//                                favorite
                                {
                                    cartVM.addFavorite(item: car)
                                    isFavorite = true

                        }
                               , label: {
                            
                            Image(systemName: "suit.heart.fill")
                                .foregroundColor(checkFavorite() ? .red : .gray)
                                .padding(.all, 10)
                                .background(Color.white)
                                .clipShape(Circle())
                        })
                        
                        Spacer()
                        
                        Button(action: {
                                cartVM.addCheckout(item: car)
                            isCheckout=true
                        }
                               , label: {
                            
                            Image(systemName: check() ? "cart.fill.badge.minus" : "cart.fill.badge.plus")
                                .foregroundColor(check() ? .green : .black)
                                .padding(.all, 10)
                                .background(Color.white)
                                .clipShape(Circle())
                        })
                    }
                    
                    Spacer()
                }
                .padding(.all, 10)
                
            }
            // dynamic frame...
            // padding 30 + spacing 15 = 45
            .frame(width: (UIScreen.main.bounds.width - 45) / 2, height: 250)
            .cornerRadius(15)
            
            Text(car.name)
                .font(.system(size: 14))
            
            Text(getPrice(value: car.price))
                .fontWeight(.bold)
            
        }
        
//        VStack(spacing:15) {
//            Image(car.image)
////            WebImage(url: URL(string:car.imageLink ))
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//
//            HStack(spacing:0) {
//                VStack(alignment: .leading, spacing: 8) {
//
//                    Text(car.name)
//                        .fontWeight(.bold)
//
//                    Text(getPrice(value: car.price))
//                        .font(.caption)
//                }
//
//                Spacer(minLength: 0)
//            }
//
//        }
//        .frame(height: items.count == 2 ? (UIScreen.main.bounds.height - 50 ) / 2.5 : nil)
//        .padding()
//        .background(Color.primary.opacity(0.05))
    }
    
    func check() -> Bool {
        return cartVM.checkoutItems.contains(where: {car.id==$0.id})
    }
    
    func checkFavorite() -> Bool {
        return cartVM.favoritesItems.contains(where: {car.id==$0.id})
    }
    
    func favorite()  {
        isFavorite=true
        var ss = cacheFavorite.storedValue ?? [Item]()
        if ss.contains(where: {$0.id==car.id}){
            ss.removeAll(where: {$0.id==car.id})
        }else{
            ss.append(car)
        }
        cacheFavorite.save(ss)
    }
    
    func checkout()  {
        isCheckout=true
        var ss = cacheCheckout.storedValue ?? [Item]()
        if ss.contains(where: {$0.id==car.id}){
            ss.removeAll(where: {$0.id==car.id})
        }else{
            ss.append(car)
        }
        cacheCheckout.save(ss)
    }

}

