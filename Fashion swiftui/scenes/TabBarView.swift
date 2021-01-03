//
//  TabBarView.swift
//  Fashion swiftui
//
//  Created by hosam on 1/3/21.
//

import SwiftUI

struct TabBarView: View {
    
    @State var search = ""
    @State var index = 0
    @State var tabIndex = 1
    
    var body: some View {
       
        ZStack{
            
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
            // Bluring The View....
                .blur(radius: 35,opaque: true)
            
            VStack {
            
            if tabIndex == 1 {
//                Home()
                SecondHome()
            }else if tabIndex == 0 {
                ScrollView{
                Text("favorites")
                }
            }else {
                HomeCheckout()
//                ScrollView{
//                Text("modalelll")
//                }
            }
            
            // Tab View....
            
            HStack(spacing: 0){
                
                Button(action: {
                    
                    tabIndex = 0
                    
                }, label: {
                    
                    Image(systemName: "suit.heart.fill")
                        .font(.system(size: 20))
                        .foregroundColor(tabIndex == 0 ? .white : Color("Color"))
                        .padding(.all)
                        .background(Color("Color").opacity(tabIndex == 0 ? 1 : 0))
                        .clipShape(Circle())
                })
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                    tabIndex = 1
                    
                }, label: {
                    
                    Image(systemName: "house.fill")
                        .font(.system(size: 20))
                        .foregroundColor(tabIndex == 1 ? .white : Color("Color"))
                        .padding(.all)
                        .background(Color("Color").opacity(tabIndex == 1 ? 1 : 0))
                        .clipShape(Circle())
                })
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                    tabIndex = 2
                    
                }, label: {
                    
                    Image(systemName: "cart.fill")
                        .font(.system(size: 20))
                        .foregroundColor(tabIndex == 2 ? .white : Color("Color"))
                        .padding(.all)
                        .background(Color("Color").opacity(tabIndex == 2 ? 1 : 0))
                        .clipShape(Circle())
                })
            }
            .padding(.top)
            .padding(.horizontal)
            // due to all edges are ignored....
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(BlurView(style: .regular))
            .clipShape(CShape())
            // shadow...
            .shadow(radius: 4)
            
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
