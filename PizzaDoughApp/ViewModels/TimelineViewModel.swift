//
//  TimelineViewModel.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 16/10/2022.
//

import Foundation


final class TimelineViewModel {
    
    
    private let dough: Dough
    private let startDate: Date
    var provingStartDate: Date {
        startDate + dough.mixIngredientsMinutes * 60
    }
    
    var formBallsStartDate: Date {
        provingStartDate + dough.provingDuration * 60 * 60
    }
    
    
    
    init(dough: Dough, startDate: Date) {
        self.dough = dough
        self.startDate = startDate
        
    }

}
