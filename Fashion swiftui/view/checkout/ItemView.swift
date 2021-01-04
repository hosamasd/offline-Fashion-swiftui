//
//  ItemView.swift
//  Fashion swiftui
//
//  Created by hosam on 1/3/21.
//

import SwiftUI

struct ItemView: View {
    
    // FOr Real Time Updates...
    @Binding var item: Item
    @Binding var items: [Item]
    @Binding var rightOrLeft: Bool
    @GestureState var isDragging = false
    
    var body: some View {
        
        ZStack{
            
            if !rightOrLeft {
                LinearGradient(gradient: .init(colors: [Color("lightblue"),Color("blue")]), startPoint: .leading, endPoint: .trailing)
                
                
                // Delete Button..
                
                
                HStack{
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.easeIn){deleteItem()}
                    }) {
                        
                        Image(systemName: "trash")
                            .font(.title)
                            .foregroundColor(.white)
                            // default Frame....
                            .frame(width: 90, height: 50)
                    }
                }
                
            }
            
            HStack(spacing:15) {
                
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130, height: 130)
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(item.name)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text(item.details)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 15){
                        
                        Text(getPrice(value: item.price))
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Spacer(minLength: 0)
                        
                        // Add - Sub Button...
                        
                        Button(action:
                                {
                        decreaseQuantiti(add: false)
                                }
//                                {
//
////                            if item.quantity > 1{item.quantity -= 1}
//                        }
                        ) {
                            
                            Image(systemName: "minus")
                                .font(.system(size: 16, weight: .heavy))
                                .foregroundColor(.black)
                        }
                        
                        Text("\(item.quantity)")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .padding(.vertical,5)
                            .padding(.horizontal,10)
                            .background(Color.black.opacity(0.06))
                        
                        Button(action: {
//                                item.quantity += 1
                            
                    decreaseQuantiti(add: true)
                            }
                        ) {
                            
                            Image(systemName: "plus")
                                .font(.system(size: 16, weight: .heavy))
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                    
                    
                }
                
            }
            .padding()
            .background(Color("gray"))
            .contentShape(Rectangle())
            .offset(x: item.offset)
            .gesture(
                //                DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
                DragGesture()
                    .updating($isDragging, body: { (value, state, _) in
                        
                        // so we can validate for correct drag..
                        state = true
                        onChanged(value: value)
                    }).onEnded({ (value) in
                        onEnd(value: value)
                    }))
            
            if rightOrLeft {
                
                    
                LinearGradient(gradient: .init(colors: [Color("lightblue"),Color("blue")]), startPoint: .leading, endPoint: .trailing)
                
                HStack{
                    
                    
                    
                    Button(action: {
                        withAnimation(.easeIn){deleteItem()}
                    }) {
                        
                        Image(systemName: "trash")
                            .font(.title)
                            .foregroundColor(.white)
                            // default Frame....
                            .frame(width: 90, height: 50)
                    }
                    
                    Spacer()
                }
                
                HStack(spacing:15) {
                    
                    Image(item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 130, height: 130)
                        .cornerRadius(15)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text(item.name)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Text(item.details)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        HStack(spacing: 15){
                            
                            Text(getPrice(value: item.price))
                                .font(.title2)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                            
                            Spacer(minLength: 0)
                            
                            // Add - Sub Button...
                            
                            Button(action: {
                                
                                if item.quantity > 1{item.quantity -= 1}
                            }) {
                                
                                Image(systemName: "minus")
                                    .font(.system(size: 16, weight: .heavy))
                                    .foregroundColor(.black)
                            }
                            
                            Text("\(item.quantity)")
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                                .padding(.vertical,5)
                                .padding(.horizontal,10)
                                .background(Color.black.opacity(0.06))
                            
                            Button(action: {item.quantity += 1}) {
                                
                                Image(systemName: "plus")
                                    .font(.system(size: 16, weight: .heavy))
                                    .foregroundColor(.black)
                            }
                        }
                        .padding()
                        
                        
                    }
                    
                }
                .padding()
                .background(Color("gray"))
                .contentShape(Rectangle())
                .offset(x: item.offset)
                .gesture(
                    //                DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
                    DragGesture()
                        .updating($isDragging, body: { (value, state, _) in
                            
                            // so we can validate for correct drag..
                            state = true
                            onChanged(value: value)
                        }).onEnded({ (value) in
                            onEnd(value: value)
                        }))
            }
            
        }
        
        //        .background(Color.white)
    }
    
    
    func onChanged(value: DragGesture.Value){
        
        //true swipe
        if !rightOrLeft {
            
            
            if value.translation.width < 0{
                
                if item.isSwiped{
                    item.offset = value.translation.width - 90
                }
                else{
                    item.offset = value.translation.width
                }
            }
        }else{
            
            //left swipe
            
            if value.translation.width > 0{
                
                if item.isSwiped{
                    item.offset = value.translation.width + 90
                }
                else{
                    item.offset = value.translation.width
                }
            }
            
        }
    }
    
   
    
    func decreaseQuantiti(add:Bool)  {
        var ss = cacheCheckout.storedValue ?? [Item]()
        if add {
            item.quantity += 1
        }else {
        if item.quantity > 1{item.quantity -= 1}
        }
        
            if ss.contains(where: {$0.id==item.id}){
                ss.removeAll(where: {$0.id==item.id})
            }else{
                ss.append(item)
            }
            cacheCheckout.save(ss)
    }
    
    func onEnd(value: DragGesture.Value){
        print(value.translation.width)
        if !rightOrLeft {
            
            withAnimation(.easeOut){
                
                if value.translation.width < 0{
                    
                    // Checking...
                    
                    if -value.translation.width > UIScreen.main.bounds.width / 2{
                        
                        item.offset = -1000
                        deleteItem()
                    }
                    else if -item.offset > 50{
                        // updating is Swipng...
                        item.isSwiped = true
                        item.offset = -90
                    }
                    else{
                        item.isSwiped = false
                        item.offset = 0
                    }
                }
                else{
                    item.isSwiped = false
                    item.offset = 0
                }
            }
        }else {
            
            //left swipe
            withAnimation(.easeOut){
                
                if value.translation.width > 0{
                    
                    // Checking...
                    
                    if value.translation.width > UIScreen.main.bounds.width / 2{
                        
                        item.offset = 1000
                        deleteItem()
                    }
                    else if item.offset > 50{
                        // updating is Swipng...
                        item.isSwiped = true
                        item.offset = 90
                    }
                    else{
                        item.isSwiped = false
                        item.offset = 0
                    }
                }
                else{
                    item.isSwiped = false
                    item.offset = 0
                }
            }
        }
        
    }
    
    // removing Item...
    
    func deleteItem(){
        
        items.removeAll { (item) -> Bool in
            return self.item.id == item.id
        }
    }
    
}

func getPrice(value: Float)->String{
    
    let format = NumberFormatter()
    format.numberStyle = .currency
    
    return format.string(from: NSNumber(value: value)) ?? ""
}

