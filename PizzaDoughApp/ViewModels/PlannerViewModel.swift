//
//  ViewModel.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 04/10/2022.
//

import Foundation

class PlannerViewModel: ObservableObject {
    func startTime(date: Date, dough: Dough) -> Date {
        return date - dough.totalMinutes * 60
    }
}



