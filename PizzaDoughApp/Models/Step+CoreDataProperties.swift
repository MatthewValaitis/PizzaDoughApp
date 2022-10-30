//
//  Step+CoreDataProperties.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 17/10/2022.
//
//

import Foundation
import CoreData


extension Step {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Step> {
        return NSFetchRequest<Step>(entityName: "Step")
    }

    @NSManaged public var name: String?
    @NSManaged public var duration: Double
    @NSManaged public var index: Int16
    @NSManaged public var dough: Dough?
    
    public var wrappedname: String {
        name ?? "Unknown Step"
    }

    

}

extension Step : Identifiable {

}
