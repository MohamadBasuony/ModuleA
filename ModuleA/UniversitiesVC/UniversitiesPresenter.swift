//
//  UniversitiesPresenter.swift
//  ModuleA
//
//  Created by Mohamad Basuony on 02/05/2024.
//

import Foundation
import CoreModule
import NetworkModule
import ModuleB

protocol UniversitiesDelegate: BaseProtocol {
    
    func getUniversitiesDidSuccess()
    
    func requestDidFail(_ message : String)

}

protocol UniversitiesPresenter {
    var universities : [UniversityModel?]? {get}

    func getUniversities()
    
    func goToUniversityDetails(university: UniversityModel?)
}

class UniversitiesPresenterImplementation: UniversitiesPresenter {
        
    var universities : [UniversityModel?]?
    
    fileprivate weak var delegate: UniversitiesDelegate?
    fileprivate var repo: UniversitiesListRepoProtocol?
    fileprivate var router: UniversitiesRouter?
    
    init(delegate: UniversitiesDelegate,
         repo: UniversitiesListRepoProtocol,
         router : UniversitiesRouter
    ) {
        self.delegate = delegate
        self.repo = repo
        self.router = router
        getUniversities()
    }
    
    func getUniversities(){
        delegate?.showIndicatorInView()
        repo?.getUniversities(completion: { [weak self] result in
            guard let self = self else {return}
            self.delegate?.hideIndicatorInView()
            switch result {
            case let .success(universities) :
                self.universities = universities
                self.delegate?.getUniversitiesDidSuccess()
            case let .failure(error) :
                delegate?.requestDidFail(error?.localizedDescription ?? "")
            default:
                print("DEFAUlT")
            }
        })
    }
    
    func goToUniversityDetails(university: UniversityModel?){
        router?.goToUniversityDetails(university: university, delegate: self)
    }
}

extension UniversitiesPresenterImplementation : UpdateProtocol {
    func updateUniversities() {
        getUniversities()
    }
}
