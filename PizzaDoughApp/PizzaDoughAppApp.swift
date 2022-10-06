//
//  PizzaDoughAppApp.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 04/10/2022.
//

import SwiftUI

@main
struct PizzaDoughAppApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView(userDough: "Nan's Dough", userProvingDuration: 8)
                .environment(\.managedObjectContext, dataController.container.viewContext)
            
        }
    }
}
