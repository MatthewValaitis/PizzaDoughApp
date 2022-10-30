//
//  Helpers.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 16/10/2022.
//

import Foundation
import CoreData


//extension Step {
//    var totalMinutes: Double {
//        let durations = dough?.provingDuration
//        let sum = durations
//    }
//}


extension Dough {
    var totalMinutes: Double {
        var totalMins: Double = 0
        for step in stepsArray {
            totalMins += step.duration
        }
        return totalMins
    }
    
}


extension Dough {
    static func getDefaultDough(moc: NSManagedObjectContext) -> Dough {
        let dough = Dough(context: moc)
        dough.name = ""
        dough.provingDuration = 0
        
        let mixStep = Step(context: moc)
        mixStep.name = "Mix Ingredients"
        mixStep.duration = 0
        mixStep.index = 0
        mixStep.dough = dough
        
        let provingStep = Step(context: moc)
        provingStep.name = "Leave to prove"
        provingStep.duration = 0
        provingStep.index = 1
        provingStep.dough = dough
        
        let formBallsStep = Step(context: moc)
        formBallsStep.name = "Form your dough balls"
        formBallsStep.duration = 0
        formBallsStep.index = 2
        formBallsStep.dough = dough
        
        return dough
    }
}
