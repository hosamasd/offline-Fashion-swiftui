//
//  Fashion_swiftuiApp.swift
//  Fashion swiftui
//
//  Created by hosam on 1/3/21.
//

import SwiftUI

@main
struct Fashion_swiftuiApp: App {
    
    var order = CartViewModel()
    var favorite = CartViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(order).environmentObject(favorite)
        }
    }
}
