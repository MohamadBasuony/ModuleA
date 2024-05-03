//
//  ModuleNavigator.swift
//  ModuleA
//
//  Created by Mohamad Basuony on 03/05/2024.
//

import Foundation
import ModuleB
import UIKit
import NetworkModule

public protocol ModuleNavigatorProtocol : AnyObject {
    func showUniversityDetails(university : UniversityModel? ,delegate : UpdateProtocol) -> UniversityDetailsVC
}

public class ModuleNavigator : ModuleNavigatorProtocol {
    public func showUniversityDetails(university : UniversityModel? ,delegate : UpdateProtocol) -> UniversityDetailsVC {
        let vc = ModuleStoryBoards.UniversityDetails.instance.instantiateViewController(withIdentifier: "UniversityDetailsVC") as! UniversityDetailsVC
        let config = UniversityDetailsConfigImplementation()
        config.configure(view: vc , university : university , updateDelegate: delegate)
        return vc
    }
}

enum ModuleStoryBoards : String {
    case UniversityDetails

    public var instance : UIStoryboard {
            return UIStoryboard(name: self.rawValue, bundle: Bundle.ModuleB)
    }
}
