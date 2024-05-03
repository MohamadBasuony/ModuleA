//
//  ListVC.swift
//  ModuleA
//
//  Created by Mohamad Basuony on 02/05/2024.
//

import UIKit
import NetworkModule
import CoreModule

public final class UniversitiesVC: UIViewController {
    @IBOutlet weak var universitiesTV: UITableView!
    
    var presenter : UniversitiesPresenter!
    public override func viewDidLoad() {
        super.viewDidLoad()
        print(";lf;dl;lfd;")
        // Do any additional setup after loading the view.
        setDelegates()
    }
    
    private func setDelegates(){
        universitiesTV.delegate = self
        universitiesTV.dataSource = self
        universitiesTV.registerNibFor(cellClass: UniversityCell.self, bundle: Bundle.ModuleA)
    }
}

extension UniversitiesVC : UniversitiesDelegate {
    
    func getUniversitiesDidSuccess() {
        universitiesTV.reloadData()
    }
    
    func requestDidFail(_ message: String) {
        AlertMessageManager.alertError(message)
    }
}

extension UniversitiesVC : UITableViewDelegate , UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.universities?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellClass: UniversityCell.self)
        cell.selectionStyle = .none
        cell.configCell(model: presenter.universities?[indexPath.row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.goToUniversityDetails(university: presenter.universities?[indexPath.row])
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension Bundle {
    public static var ModuleA:Bundle {
        return Bundle(for: UniversitiesVC.self)
    }
}
