//
//  TableViewCell.swift
//  sonnt.trainingTTC
//
//  Created by Nero on 10/2/20.
//  Copyright © 2020 Nero. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    //MARK: Outlet
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailAddressLabel: UILabel!
    @IBOutlet weak var detailGenderLabel: UILabel!
    @IBOutlet weak var detailPositionLabel: UILabel!
    
    //MARK: Let, var
    var navigationController = UINavigationController()
    var clickEditButton:(()->  Void)?
    var clickDeleteButton:(()->  Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: Action
    @IBAction func editAction(_ sender: Any) {
        if let edit = clickEditButton{
            edit()
        }
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        if let delete = clickDeleteButton{
            delete()
        }
    }
}
