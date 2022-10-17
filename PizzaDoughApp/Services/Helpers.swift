//
//  Helpers.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 16/10/2022.
//

import Foundation


extension Dough {
    var totalMinutes: Double {
        (provingDuration * 60) + (formDoughBallsMinutes + mixIngredientsMinutes)
    }
}
