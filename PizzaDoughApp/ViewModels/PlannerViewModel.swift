//
//  ViewModel.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 04/10/2022.
//

import Foundation

class PlannerViewModel: ObservableObject {
    func startTime(date: Date, dough: Dough) -> Date {
        return date - dough.totalMinutes
    }
    
//    func doughBallTime(date: Date, provingTime: Double, dough: Dough) -> Date {
//        return date - dough.totalMinutes
//    }
}


fileprivate extension Dough {
    var totalMinutes: Double {
        (provingDuration * 60 * 60) + (formDoughBallsMinutes + mixIngredientsMinutes) * 60
    }
}
