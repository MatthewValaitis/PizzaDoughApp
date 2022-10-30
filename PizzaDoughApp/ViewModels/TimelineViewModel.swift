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
  
    
    func getStartDate(for stepIndex: Int) -> Date {
        if stepIndex == 0 {
            return startDate
        }
        
        var totalMinutes = 0.0
        
        if stepIndex == 1 {
            totalMinutes += dough.stepsArray[0].duration
        } else {
            for i in 0..<stepIndex {
                totalMinutes += dough.stepsArray[i].duration
            }
        }
        
        return startDate + totalMinutes * 60
    }
    
    
    init(dough: Dough, startDate: Date) {
        self.dough = dough
        self.startDate = startDate
        
    }

}
