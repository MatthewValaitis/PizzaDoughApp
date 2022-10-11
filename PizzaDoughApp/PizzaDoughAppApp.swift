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
    
//    let defaultDoughs = [ Dough(type: "Neapolitan", provingDuration: 12.0, description: ""),
//                          Dough(type: "Biga", provingDuration: 18.0, description: ""),
//                          Dough(type: "Sourdough", provingDuration: 24.0, description: ""),
//                          Dough(type: "Gluten Free", provingDuration: 5.0, description: ""),
//                          Dough(type: "Sicilian", provingDuration: 12.0, description: "") ]
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
            
        }
    }
}
