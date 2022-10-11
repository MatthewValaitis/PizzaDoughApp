//
//  ViewModel.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 04/10/2022.
//

import Foundation

class ContentViewModel: ObservableObject {
    // TODO: make these structs with properties e.g. proving times
//    @Published var doughTypes = [ Dough(type: "Neapolitan", provingDuration: 12.0, description: ""),
//                                  Dough(type: "Biga", provingDuration: 18.0, description: ""),
//                                  Dough(type: "Sourdough", provingDuration: 24.0, description: ""),
//                                  Dough(type: "Gluten Free", provingDuration: 5.0, description: ""),
//                                  Dough(type: "Sicilian", provingDuration: 12.0, description: "")
//    ]
    

    
    func startTime(date: Date, dough: Dough) -> Date {
        return date - (dough.provingDuration * 60 * 60)
    }
    
}

