//
//  Drinks+CoreDataProperties.swift
//  Practica3
//
//  Created by Oscar Hernandez on 08/04/22.
//
//

import Foundation
import CoreData


extension Drinks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Drinks> {
        return NSFetchRequest<Drinks>(entityName: "Drinks")
    }

    @NSManaged public var name: String?
    @NSManaged public var ingredients: String?
    @NSManaged public var instructions: String?
    @NSManaged public var image: String?

}

extension Drinks : Identifiable {

}
