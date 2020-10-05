//
//  InfoViewController.swift
//  sonnt.trainingTTC
//
//  Created by Nero on 10/2/20.
//  Copyright © 2020 Nero. All rights reserved.
//

import UIKit

protocol InfoDelegate {
    func didChangeInfo(person: PersonBO?, index: Int)
}

class InfoViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var genderSwitch: UISwitch!
    
    var person: PersonBO?
    var delegate: InfoDelegate?
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = person?.name
        addressTextField.text = person?.address
        genderSwitch.isOn = person?.isMale ?? false
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func confirmAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        if self.delegate != nil {
            let employee = self.person
            employee?.name = self.nameTextField.text
            employee?.address = self.addressTextField.text
            employee?.isMale = self.genderSwitch.isOn
            self.delegate?.didChangeInfo(person: employee, index: self.index)
        }
    }
}
