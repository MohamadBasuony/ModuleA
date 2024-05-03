//
//  UniversitiesRouter.swift
//  ModuleA
//
//  Created by Mohamad Basuony on 02/05/2024.
//

import Foundation
import NetworkModule
import ModuleB

protocol UniversitiesRouter {
    func goToUniversityDetails(university: UniversityModel?, delegate: UpdateProtocol)
}

class UniversitiesRouterImplementation: UniversitiesRouter {

    fileprivate weak var view: UniversitiesVC?
    
    init(view: UniversitiesVC) {
        self.view = view
    }
    
    func goToUniversityDetails(university: UniversityModel?, delegate: UpdateProtocol) {
        let vc = ModuleNavigator().showUniversityDetails(university: university, delegate: delegate)
        view?.present(vc, animated: true)
    }
}
