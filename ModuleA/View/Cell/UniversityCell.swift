//
//  UniversityCell.swift
//  ModuleA
//
//  Created by Mohamad Basuony on 02/05/2024.
//

import UIKit
import NetworkModule

class UniversityCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var stateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(model : UniversityModel?){
        nameLbl.text = model?.name ?? ""
        stateLbl.text = model?.stateProvince ?? ""
    }
    
}
