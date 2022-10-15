//
//  Double+timeString.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 13/10/2022.
//

import Foundation


extension Double {
    var minutesToTimeString: String {
        let hours = (self / 60).rounded(.towardZero)
        let hoursString = hours < 10 ? "0\(Int(hours))" : "\(Int(hours))"
        
        let mins = Int(self - (hours * 60))
        let minsString = mins < 10 ? "0\(mins)" : "\(mins)"
        
        return hoursString + ":" + minsString
    }
}
