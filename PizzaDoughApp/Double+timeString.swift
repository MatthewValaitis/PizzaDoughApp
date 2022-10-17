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
        let hoursString = "\(Int(hours))h "
        
        let mins = Int(self - (hours * 60))
        let minsString = "\(mins)m"
        
        return hoursString + minsString
    }
}
// 1h 10m
