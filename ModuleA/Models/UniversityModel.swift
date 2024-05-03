//
//  UniversityModel.swift
//  ModuleA
//
//  Created by Mohamad Basuony on 02/05/2024.
//

import Foundation
import CoreData
import RealmSwift
// MARK: - UniversityModelElement
public class UniversityModel: Object, Codable  {
    public var domains: [String]?
    @objc dynamic public var stateProvince: String?
    @objc dynamic public var name: String?
    public var webPages: [String]?
    @objc dynamic public var country: String?
    @objc dynamic public var alphaTwoCode: String?

    enum CodingKeys: String, CodingKey {
        case domains
        case stateProvince = "state-province"
        case name
        case webPages = "web_pages"
        case country
        case alphaTwoCode = "alpha_two_code"
    }
    
    public var webPage : String {
        return webPages?.first ?? ""
    }
    
    public override static func primaryKey() -> String? {
         return "name"
     }
}

extension UniversityModel {
    public convenience init(university : UniversityModel) {
        self.init()
        self.name = university.name
        self.stateProvince = university.stateProvince
        self.country = university.country
        self.alphaTwoCode = university.alphaTwoCode
        self.webPages = university.webPages
    }
}

extension UniversityModel {
    public func toManagedObject(in context: NSManagedObjectContext) -> UniversityManagedObject? {
        let entityName = "UniversityA"
        guard let entityDescription = NSEntityDescription.entity(forEntityName: entityName, in: context) else {
            NSLog("Can't create entity \(entityName)")
            return nil
        }
        let object = UniversityManagedObject.init(entity: entityDescription, insertInto: context)
        object.name = name
        object.state = stateProvince
        object.country = country
        object.countryCode = alphaTwoCode
        object.webPage = webPages?.first
        return object
    }
}
