//
//  HomeCheckout.swift
//  Fashion swiftui
//
//  Created by hosam on 1/3/21.
//

import SwiftUI

struct HomeCheckout: View {
   
    @StateObject var cartData = CartViewModel()
    @State var rightOrLeft = false
    var topHeight:CGFloat = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 40
    
    var body: some View {
       
        VStack {
            
            HStack {
                
                Spacer()
                
                Text("My cart")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Spacer()
                
             
            }
            .padding(.top,topHeight-20)
//            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                LazyVStack(spacing: 0){
                    
                    ForEach(cartData.items){item in
                        
                        // ItemView...
                        ItemView(item: $cartData.items[getIndex(item: item)],items: $cartData.items,rightOrLeft: $rightOrLeft)
                    }
                }
            }
            
            // Bottom View...
            
            VStack{
                
                HStack{
                    
                    Text("Total")
                        .fontWeight(.heavy)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    // calculating Total Price...
                    Text(calculateTotalPrice())
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }
                .padding([.top,.horizontal])
                
                Button(action: {}) {
                    
                    Text("Check out")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(
                        
                            LinearGradient(gradient: .init(colors: [Color("lightblue"),Color("blue")]), startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(15)
                }
            }
            .background(Color.white)
            
        }
//        .background(Color("gray").ignoresSafeArea())
        
    }
    
    func getIndex(item: Item)->Int{
        
        return cartData.items.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
    
    func calculateTotalPrice()->String{
        
        var price : Float = 0
        
        cartData.items.forEach { (item) in
            price += Float(item.quantity) * item.price
        }
        
        return getPrice(value: price)
    }
    
}

struct Home_Pxreviews: PreviewProvider {
    static var previews: some View {
        HomeCheckout()
    }
}

