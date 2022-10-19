//
//  Dough+CoreDataProperties.swift
//  PizzaDoughApp
//
//  Created by The Valaitis Brothers on 17/10/2022.
//
//

import Foundation
import CoreData


extension Dough {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dough> {
        return NSFetchRequest<Dough>(entityName: "Dough")
    }

    @NSManaged public var additionalInfo: String?
    @NSManaged public var formDoughBallsMinutes: Double
    @NSManaged public var id: UUID?
    @NSManaged public var imageName: String?
    @NSManaged public var mixIngredientsMinutes: Double
    @NSManaged public var name: String?
    @NSManaged public var provingDuration: Double
    @NSManaged public var steps: NSSet?

}

// MARK: Generated accessors for steps
extension Dough {

    @objc(addStepsObject:)
    @NSManaged public func addToSteps(_ value: Step)

    @objc(removeStepsObject:)
    @NSManaged public func removeFromSteps(_ value: Step)

    @objc(addSteps:)
    @NSManaged public func addToSteps(_ values: NSSet)

    @objc(removeSteps:)
    @NSManaged public func removeFromSteps(_ values: NSSet)

}

extension Dough : Identifiable {

}
