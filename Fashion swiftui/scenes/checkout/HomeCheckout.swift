//
//  HomeCheckout.swift
//  Fashion swiftui
//
//  Created by hosam on 1/3/21.
//

import SwiftUI

var topHeight:CGFloat = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 40

struct HomeCheckout: View {
    
    @EnvironmentObject var cartData: CartViewModel
//    @State var data = cacheCheckout.storedValue ?? [Item]()
    @State var rightOrLeft = false
   
    @State var added = false
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
            .padding()
            .padding(.top,topHeight-20)
            
            //            VStack {
            
            if !cartData.checkoutItems.isEmpty {
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 0){
                        
                        ForEach(cartData.checkoutItems){item in
                            
                            // ItemView...
                            ItemView(item: $cartData.checkoutItems[getIndex(item: item)],items: $cartData.checkoutItems,rightOrLeft: $rightOrLeft)
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
                    
                    Button(action: {
                        
                        self.added.toggle()
                    }) {
                        
//                        Label(title: {
//                            Text(added ? "Done" : "Check out")
//                                .font(.title2)
//                                .foregroundColor(.black)
//                                .fontWeight(.heavy)
//                        }) {
//
//                            Image(systemName: added ? "checkmark.circle.fill" : "cart.fill")
//                                .font(.system(size: 22))
//                                .foregroundColor(.black)
//                        }
                        
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
//                    .padding(.vertical)
//                    // padding 30 + 45 = 75
//                    .frame(width: UIScreen.main.bounds.width - 30)
//                    .background(added ? Color.green : Color("red"))
//                    .clipShape(Capsule())
////                    .padding(.leading,-45)
//                    .padding(.top)
                }
                .background(Color.white)
                
            }else {
                ScrollView {
                    Text("no Checkout added yet.....")
                }
            }
            
            
            
        }
        // Alert View...
        .alert(isPresented: $added, content: {
            Alert(title: Text("SUCCESS"), message: Text("your orders maded\n thanks"), dismissButton: .default(Text("OK"), action: {
                // Do Some Code Here...
                self.added.toggle()
//                self.cartData.checkoutItems.removeAll()
            })
           )
        })
        //        .background(Color("gray").ignoresSafeArea())
        
    }
    
    func getIndex(item: Item)->Int{
        
        return cartData.checkoutItems.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
    
    func calculateTotalPrice()->String{
        
        var price : Float = 0
//        var ss = cacheCheckout.storedValue ?? [Item]()
        var ss = cartData.checkoutItems
//
        ss.forEach { (item) in
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

