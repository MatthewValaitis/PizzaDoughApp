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
    
    typealias DoughProperties = (type: String, provingDuration: Double, mixingDuration: Double, formDoughBallsDuration: Double, description: String, imageName: String)
    
    let defaultDoughs: [DoughProperties] = [
        (type: "Neapolitan", provingDuration: 12.0, mixingDuration: 30, formDoughBallsDuration: 22, description: "", imageName: "Neapolitan"),
        (type: "Biga", provingDuration: 18.0, mixingDuration: 20, formDoughBallsDuration: 10, description: "", imageName: "Biga"),
        (type: "Sourdough", provingDuration: 24.0, mixingDuration: 15, formDoughBallsDuration: 10, description: "", imageName: "Sourdough"),
        (type: "Gluten Free", provingDuration: 5.0, mixingDuration: 20, formDoughBallsDuration: 10, description: "", imageName: "Gluten Free"),
        (type: "Sicilian", provingDuration: 12.0, mixingDuration: 10, formDoughBallsDuration: 10, description: "", imageName: "Sicilian")
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
            dough.additionalInfo = doughProperties.description
            dough.id = UUID()
            dough.imageName = doughProperties.imageName
            
            let mixingStep = Step(context: container.viewContext)
            mixingStep.duration = doughProperties.mixingDuration
            mixingStep.index = 0
            mixingStep.name = "Mixing Ingredients"
            mixingStep.dough = dough
            
            let formingStep = Step(context: container.viewContext)
            formingStep.duration = doughProperties.formDoughBallsDuration
            formingStep.index = 2
            formingStep.name = "Forming doughballs"
            formingStep.dough = dough
            
            let provingStep = Step(context: container.viewContext)
            provingStep.duration = doughProperties.provingDuration
            provingStep.name = "Proving time"
            provingStep.index = 1
            provingStep.dough = dough
            
            
            
            
        }
        
        do {
            try container.viewContext.save()
            UserDefaults.standard.set(true, forKey: hasSetUserDefaultsKey)
        } catch {
            print("There was an error saving the default doughs")
        }
    }
}
