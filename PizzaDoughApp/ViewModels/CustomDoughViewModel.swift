//
//  CustomDoughViewModel.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 18/10/2022.
//

import Foundation
import SwiftUI
import CoreData

final class CustomDoughViewModel: ObservableObject {
    @Published var steps: [StepViewModel] = []
    
    struct StepViewModel: Identifiable {
        var id = UUID()
        var index: Int
        var name: String?
        var duration: Int?
        
        mutating func incrementIndex(by amount: Int) {
            self.index += amount
            
        }
    }
    
    func createStep(moc: NSManagedObjectContext) {
        let step = StepViewModel(index: steps.count)
        steps.append(step)
    }
    
    func insertStep(at index: Int) {
        let step = StepViewModel(index: index)
        
        steps.insert(step, at: index)
        
        if (steps.count - 1) - index > 1 {
            for i in (index + 1)..<steps.count {
                steps[i].incrementIndex(by: 1)
            }
        } else if (steps.count - 1) > index {
            steps[index + 1].incrementIndex(by: 1)
        }
    }
    
    func deleteStep() {
        steps.removeLast()
    }
    
    func saveDough(name: String, description: String, moc: NSManagedObjectContext) {
        let customDough = Dough(context: moc)
        customDough.id = UUID()
        customDough.name = name
        customDough.additionalInfo = description

        
        var stepModels: [Step] = []
        for stepViewModel in steps {
            let step = Step(context: moc)
            step.name = stepViewModel.name
            step.duration = Double(stepViewModel.duration ?? 0)
            
            step.index = Int16(stepViewModel.index)
            step.dough = customDough
            
            stepModels.append(step)
        }
        
        
        if moc.hasChanges {
            try? moc.save()
            
        }
        
        
    }
    
    
    func getStepNameBinding(for index: Int) -> Binding<String> {
        return Binding(get: {
            guard let step = self.steps.first(where: { $0.index == Int16(index) }) else {
                return ""
            }
            return step.name ?? ""
        }, set: { newName in
            guard self.steps.first(where: { $0.index == Int16(index) }) != nil else {
                return 
            }
            self.steps[index].name = newName
        })
    }
    
    func getDurationBinding(for index: Int) -> Binding<String> {
        return Binding(get: {
            guard let step = self.steps.first(where: { $0.index == Int16(index) }),
                  let duration = step.duration else {
                return ""
            }
            return String(duration)
        }, set: { newDurationString in
            guard let newDuration = Int(newDurationString) else {
                self.steps[index].duration = nil
                return
            }
            self.steps[index].duration = newDuration
        })
    }
    
}
