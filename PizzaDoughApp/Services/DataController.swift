//
//  DataController.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 06/10/2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "Dough")
    
    typealias DoughProperties = (type: String, provingDuration: Double, description: String, imageName: String, formDoughBalls: Double, mixIngredients: Double)
    
    let defaultDoughs: [DoughProperties] = [
        (type: "Neapolitan", provingDuration: 12.0, description: "", imageName: "Neapolitan", formDoughBalls: 9.0, mixIngredients: 30),
        (type: "Biga", provingDuration: 18.0, description: "", imageName: "Biga", formDoughBalls: 15.0, mixIngredients: 20),
        (type: "Sourdough", provingDuration: 24.0, description: "", imageName: "Sourdough", formDoughBalls: 20.0, mixIngredients: 20),
        (type: "Gluten Free", provingDuration: 5.0, description: "", imageName: "Gluten Free", formDoughBalls: 1.0, mixIngredients: 25),
        (type: "Sicilian", provingDuration: 12.0, description: "", imageName: "Sicilian", formDoughBalls: 9, mixIngredients: 35)
    ]
    private let hasSetUserDefaultsKey = "hasSetUserDefaultsKey"
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        
        if UserDefaults.standard.value(forKey: hasSetUserDefaultsKey) as? Bool == nil {
            setDefaultDoughs()
        }
    }
    
    func setDefaultDoughs() {
        for doughProperties in defaultDoughs {
            let dough = Dough(context: container.viewContext)
            dough.name = doughProperties.type
            dough.provingDuration = doughProperties.provingDuration
            dough.additionalInfo = doughProperties.description
            dough.id = UUID()
            dough.imageName = doughProperties.imageName
            dough.formDoughBallsMinutes = doughProperties.formDoughBalls
            dough.mixIngredientsMinutes = doughProperties.mixIngredients
        }
        
        do {
            try container.viewContext.save()
            UserDefaults.standard.set(true, forKey: hasSetUserDefaultsKey)
        } catch {
            print("There was an error saving the default doughs")
        }
    }
}
