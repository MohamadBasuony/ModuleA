//
//  ListConfig.swift
//  ModuleA
//
//  Created by Mohamad Basuony on 02/05/2024.
//

import Foundation
public protocol UniversitiesConfig {
    func configure(view: UniversitiesVC)
}

public class UniversitiesConfigImplementation: UniversitiesConfig {
    public init() {}
    public func configure(view: UniversitiesVC) {
        let repo = UniversitiesListRepo()
        let router = UniversitiesRouterImplementation(view: view)
        
        let presenter = UniversitiesPresenterImplementation(delegate: view, repo: repo, router: router)
        
        view.presenter = presenter
    }
}
