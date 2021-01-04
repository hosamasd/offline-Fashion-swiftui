//
//  SecondHome.swift
//  Fashion swiftui
//
//  Created by hosam on 1/3/21.
//

import SwiftUI

struct SecondHome: View {
    @State var search = ""
    @State var index = 0
    @State var tabIndex = 1
    @StateObject var vm = CartViewModel()
    @State var items = Array(repeating: GridItem(spacing:15), count: 2)
    
    var body: some View {
        
        
        //        ZStack{
        //
        //            Image("bg")
        //                .resizable()
        //                .aspectRatio(contentMode: .fill)
        //                .frame(width: UIScreen.main.bounds.width)
        //            // Bluring The View....
        //                .blur(radius: 35,opaque: true)
        
        // ScrollView...
        
        //            VStack(spacing: 0){
        
        ScrollView{
            
            VStack {
                
                HStack{
                    
                    Button(action: {}, label: {
                        
                        Image("menu")
                            .renderingMode(.original)
                    })
                    
                    Spacer()
                    
                    Image("pic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                .padding()
                
                HStack{
                    
                    Text("Find Your\nFavourite Clothes")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                }
                .padding(.horizontal)
                
                HStack(spacing: 25){
                    
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 22))
                        .foregroundColor(.black)
                    
                    VStack(alignment: .leading){
                        
                        TextField("Search", text: $search)
                        
                        Divider()
                            .background(Color.black)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal)
                
                // Menu....
                
                HStack(spacing: 15){
                    
                    ForEach(0..<menu.count,id: \.self){i in
                        
                        Button(action: {
                            
                            index = i
                            
                        }, label: {
                            
                            VStack(spacing: 8){
                                
                                Text(menu[i])
                                    .foregroundColor(.black)
                                    .fontWeight(index == i ? .bold : .none)
                                    .font(.system(size: 14))
                                
                                Circle()
                                    .fill(Color.black)
                                    .frame(width: 6, height: 6)
                                    .opacity(index == i ? 1 : 0)
                            }
                            .padding(.vertical)
                        })
                    }
                }
                .padding(.top, 10)
            }
            // due to all edges are ignored....
            .padding(.top,topHeight-20)
//            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
//            .padding(.bottom)
            
            // Row View....
            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//
//                withAnimation(Animation.linear){
            
            if !vm.items.isEmpty {
            
            LazyVGrid(columns: items) {
                ForEach(vm.items) {card in
                    HomeItemView(car: card, items: $items)
                }
            }
            .padding()
            }else {
                ProgressView()
            }
//                }
//            }
            
            //                Spacer()
            
        }
        // due to all edges are ignored....
        .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
        .padding(.bottom)
      
    }
}



var menu = ["New","Popular","Trending","Highlights","Medium"]
