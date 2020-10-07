//
//  FirstViewController.swift
//  sonnt.trainingTTC
//
//  Created by Nero on 10/2/20.
//  Copyright © 2020 Nero. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var listEmployeeTableView: UITableView!
    
    var listEmployee = [PersonBO]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listEmployeeTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        listEmployeeTableView.delegate = self
        listEmployeeTableView.dataSource = self
        RequestModel.getData(type: EmployeeBO.self){ obj in
            self.listEmployee = obj.employees
            DispatchQueue.main.async {
                self.listEmployeeTableView.reloadData()
            }
        }
    }
    
    //MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listEmployee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listEmployeeTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.detailNameLabel.text  = listEmployee[indexPath.row].name
        cell.detailAddressLabel.text = listEmployee[indexPath.row].address
        cell.detailGenderLabel.text = listEmployee[indexPath.row].isMale ?? false ? "Nam" : "Nữ"
        cell.detailPositionLabel.text = listEmployee[indexPath.row].level.map { $0.rawValue }
        
        cell.clickEditButton = {
            let editCell = InfoViewController()
            editCell.person = self.listEmployee[indexPath.row]
            editCell.delegate = self
            editCell.index = indexPath.row
            self.present(editCell, animated: true, completion: nil)
        }
        
        cell.clickDeleteButton = {
            let deleteNotice = UIAlertController(title: "Thông báo", message: "Bạn có chắc chắn muốn xóa?", preferredStyle: .alert)
            deleteNotice.addAction(UIAlertAction(title: "Có", style: .default, handler: { action in
                self.listEmployee.remove(at: indexPath.row)
                self.listEmployeeTableView.reloadData()
            }))
            deleteNotice.addAction(UIAlertAction(title: "Không", style: .cancel, handler: nil))
            self.present(deleteNotice, animated: true,completion: nil)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension FirstViewController: InfoDelegate {
    func didChangeInfo(person: PersonBO?, index: Int) {
        self.listEmployee[index] = person!
        self.listEmployeeTableView.reloadData()
    }
}
