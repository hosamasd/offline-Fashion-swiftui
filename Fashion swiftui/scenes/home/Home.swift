////
////  Home.swift
////  Fashion swiftui
////
////  Created by hosam on 1/3/21.
////
//
//import SwiftUI
//
//struct Home: View {
//    @State var search = ""
//    @State var index = 0
//    @State var tabIndex = 1
//    @StateObject var vm = CartViewModel()
//    var body: some View {
//        
//        
//        //        ZStack{
//        //            
//        //            Image("bg")
//        //                .resizable()
//        //                .aspectRatio(contentMode: .fill)
//        //                .frame(width: UIScreen.main.bounds.width)
//        //            // Bluring The View....
//        //                .blur(radius: 35,opaque: true)
//        
//        // ScrollView...
//        
//        //            VStack(spacing: 0){
//        
//        ScrollView{
//            
//            VStack {
//                
//                HStack{
//                    
//                    Button(action: {}, label: {
//                        
//                        Image("menu")
//                            .renderingMode(.original)
//                    })
//                    
//                    Spacer()
//                    
//                    Image("pic")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 40, height: 40)
//                        .clipShape(Circle())
//                }
//                .padding()
//                
//                HStack{
//                    
//                    Text("Find Your\nFavourite Clothes")
//                        .font(.system(size: 30))
//                        .foregroundColor(.black)
//                    
//                    Spacer(minLength: 0)
//                }
//                .padding(.horizontal)
//                
//                HStack(spacing: 25){
//                    
//                    Image(systemName: "magnifyingglass")
//                        .font(.system(size: 22))
//                        .foregroundColor(.black)
//                    
//                    VStack(alignment: .leading){
//                        
//                        TextField("Search", text: $search)
//                        
//                        Divider()
//                            .background(Color.black)
//                    }
//                }
//                .padding(.vertical)
//                .padding(.horizontal)
//                
//                // Menu....
//                
//                HStack(spacing: 15){
//                    
//                    ForEach(0..<menu.count,id: \.self){i in
//                        
//                        Button(action: {
//                            
//                            index = i
//                            
//                        }, label: {
//                            
//                            VStack(spacing: 8){
//                                
//                                Text(menu[i])
//                                    .foregroundColor(.black)
//                                    .fontWeight(index == i ? .bold : .none)
//                                    .font(.system(size: 14))
//                                
//                                Circle()
//                                    .fill(Color.black)
//                                    .frame(width: 6, height: 6)
//                                    .opacity(index == i ? 1 : 0)
//                            }
//                            .padding(.vertical)
//                        })
//                    }
//                }
//                .padding(.top, 10)
//            }
//            // due to all edges are ignored....
//            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
//            .padding(.bottom)
//            
//            // Row View....
//            
//            HStack(spacing: 15){
//                
//                VStack(alignment: .leading,spacing: 10){
//                    
//                    ZStack{
//                        
//                        BlurView(style: .regular)
//                        
//                        Image("p1")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                        
//                        VStack{
//                            
//                            HStack{
//                                
//                                Button(action: {}, label: {
//                                    
//                                    Image(systemName: "suit.heart.fill")
//                                        .foregroundColor(.red)
//                                        .padding(.all, 10)
//                                        .background(Color.white)
//                                        .clipShape(Circle())
//                                })
//                                
//                                Spacer()
//                            }
//                            
//                            Spacer()
//                        }
//                        .padding(.all, 10)
//                        
//                    }
//                    // dynamic frame...
//                    // padding 30 + spacing 15 = 45
//                    .frame(width: (UIScreen.main.bounds.width - 45) / 2, height: 250)
//                    .cornerRadius(15)
//                    
//                    Text("Summer Top")
//                        .font(.system(size: 14))
//                    
//                    Text("$129")
//                        .fontWeight(.bold)
//                    
//                }
////                
//                VStack(alignment: .leading,spacing: 10){
//                    
//                    ZStack{
//                        
//                        BlurView(style: .regular)
//                        
//                        Image("p2")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .rotationEffect(.init(degrees: 5))
//                        
//                        // Like Button...
//                        
//                        VStack{
//                            
//                            HStack{
//                                
//                                Button(action: {}, label: {
//                                    
//                                    Image(systemName: "suit.heart.fill")
//                                        .foregroundColor(.red)
//                                        .padding(.all, 10)
//                                        .background(Color.white)
//                                        .clipShape(Circle())
//                                })
//                                
//                                Spacer()
//                            }
//                            
//                            Spacer()
//                        }
//                        .padding(.all, 10)
//                        
//                    }
//                    // dynamic frame...
//                    // padding 30 + spacing 15 = 45
//                    .frame(width: (UIScreen.main.bounds.width - 45) / 2, height: 250)
//                    .cornerRadius(15)
//                    
//                    Text("Trend Top")
//                        .font(.system(size: 14))
//                    
//                    Text("$159")
//                        .fontWeight(.bold)
//                    
//                }
//                
//            }
//            .padding(.all)
            
            
//            HStack{
//
//                Text("New Collections")
//                    .font(.system(size: 22))
//                    .foregroundColor(.black)
//
//                Spacer()
//            }
//            .padding(.horizontal)
//            .padding(.top,10)
            
            
//            ZStack{
//
//                BlurView(style: .regular)
//
//                HStack{
//
//                    VStack(alignment: .leading,spacing: 10){
//
//                        Text("Causal Top")
//                            .foregroundColor(.black)
//
//                        Text("$299")
//                            .font(.system(size: 20))
//                            .fontWeight(.bold)
//
//                        Button(action: {}, label: {
//
//                            Text("Try Now")
//                                .foregroundColor(.black)
//                                .padding(.vertical, 10)
//                                .padding(.horizontal, 20)
//                                .background(Color.white)
//                                .clipShape(Capsule())
//                        })
//                        .padding(.top, 10)
//                    }
//
//                    Image("p3")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                }
//
//                VStack{
//
//                    HStack{
//
//                        Button(action: {}, label: {
//
//                            Image(systemName: "suit.heart.fill")
//                                .foregroundColor(.red)
//                                .padding(.all, 10)
//                                .background(Color.white)
//                                .clipShape(Circle())
//                        })
//
//                        Spacer()
//                    }
//
//                    Spacer()
//                }
//                .padding(.all, 10)
//            }
//            .frame(height: 250)
//            .cornerRadius(15)
//            .padding()
//            
//            //                Spacer()
//            
//        }
//        // due to all edges are ignored....
//        .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
//        .padding(.bottom)
//        
//        //            // Tab View....
//        //            
//        //            HStack(spacing: 0){
//        //                
//        //                Button(action: {
//        //                    
//        //                    tabIndex = 0
//        //                    
//        //                }, label: {
//        //                    
//        //                    Image(systemName: "suit.heart.fill")
//        //                        .font(.system(size: 20))
//        //                        .foregroundColor(tabIndex == 0 ? .white : Color("Color"))
//        //                        .padding(.all)
//        //                        .background(Color("Color").opacity(tabIndex == 0 ? 1 : 0))
//        //                        .clipShape(Circle())
//        //                })
//        //                
//        //                Spacer(minLength: 0)
//        //                
//        //                Button(action: {
//        //                    
//        //                    tabIndex = 1
//        //                    
//        //                }, label: {
//        //                    
//        //                    Image(systemName: "house.fill")
//        //                        .font(.system(size: 20))
//        //                        .foregroundColor(tabIndex == 1 ? .white : Color("Color"))
//        //                        .padding(.all)
//        //                        .background(Color("Color").opacity(tabIndex == 1 ? 1 : 0))
//        //                        .clipShape(Circle())
//        //                })
//        //                
//        //                Spacer(minLength: 0)
//        //                
//        //                Button(action: {
//        //                    
//        //                    tabIndex = 2
//        //                    
//        //                }, label: {
//        //                    
//        //                    Image(systemName: "cart.fill")
//        //                        .font(.system(size: 20))
//        //                        .foregroundColor(tabIndex == 2 ? .white : Color("Color"))
//        //                        .padding(.all)
//        //                        .background(Color("Color").opacity(tabIndex == 2 ? 1 : 0))
//        //                        .clipShape(Circle())
//        //                })
//        //            }
//        //            .padding(.top)
//        //            .padding(.horizontal)
//        //            // due to all edges are ignored....
//        //            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
//        //            .background(BlurView(style: .regular))
//        //            .clipShape(CShape())
//        //            // shadow...
//        //            .shadow(radius: 4)
//        //            
//        //            }
//        //        }
//        //        .edgesIgnoringSafeArea(.all)
//        
//        //    }
//    }
//}
//
//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}
//
//
////var menu = ["New","Popular","Trending","Highlights","Medium"]
