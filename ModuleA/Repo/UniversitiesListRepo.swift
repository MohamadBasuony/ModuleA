//
//  ListRepo.swift
//  
//
//  Created by Mohamad Basuony on 02/05/2024.
//

import Foundation
import UIKit
import NetworkModule
import CoreData
import RealmSwift
public protocol UniversitiesListRepoProtocol : AnyObject {
    func getUniversities(completion : @escaping ResponseResult<[UniversityModel?]>)
}

public class UniversitiesListRepo : UniversitiesListRepoProtocol {
    public func getUniversities(completion : @escaping ResponseResult<[UniversityModel?]>) {
        UniversitiesApis.searchUniversities.request(data: [UniversityModel].self) {[weak self] result in
            guard let self = self else {return}
            switch result {
            case let .success(universities) :
                saveUniversitiesToRealm(universities: universities)
                completion(ResultStatus.success(universities))
            case let .failure(error):
                let universities = getUniversitiesFromRealm()
                if !universities.isEmpty {
                    completion(ResultStatus.success(universities))
                }else{
                    print("Errors" , error?.localizedDescription ?? "")
                    completion(ResultStatus.failure(error))
                }
            default:
                print("unknown")
            }
        }
    }
    
    // Changed From CoreData To Realm due inconvenience of CoreData With Modular Arch
    func saveUniversitiesToRealm(universities: [UniversityModel]){
        let realm = try! Realm()
        try! realm.write {
            for university in universities {
                realm.add(university ,update: .modified)
            }
        }
    }
    
    func getUniversitiesFromRealm() -> [UniversityModel]{
        let realm = try! Realm()
        var universities = [UniversityModel]()
        try! realm.write {
            let realmUniversities = realm.objects(UniversityModel.self)
            for university in realmUniversities {
                universities.append(university)
            }
        }
        return universities
    }
}
