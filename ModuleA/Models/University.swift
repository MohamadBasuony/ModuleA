//
//  University.swift
//  ModuleA
//
//  Created by Mohamad Basuony on 03/05/2024.
//

import Foundation
import CoreData
import NetworkModule
//// MARK: - CoreData Managed Object
///
@objc(UserManagedObject)
public class UniversityManagedObject: NSManagedObject {

}

extension UniversityManagedObject {
    @NSManaged var name: String?
    @NSManaged var state: String?
    @NSManaged var country: String?
    @NSManaged var countryCode: String?
    @NSManaged var webPage: String?
    
//    func toModel() -> UniversityModel? {
//        return UniversityModel(name: name, state: state, country: country, countryCode: countryCode, webPages: [webPage ?? ""] )
//    }
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<UniversityManagedObject> {
        return NSFetchRequest<UniversityManagedObject>(entityName: "UniversityA")
    }
}
