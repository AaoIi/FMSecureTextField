//
//  ViewController.swift
//  FMSecureTextFieldExample
//
//  Created by Mobile build server on 7/31/19.
//  Copyright © 2019 Saad Albasha. All rights reserved.
//

import UIKit
import FMSecureTextField

class ViewController: UIViewController {

    @IBOutlet var passwordTextField: FMSecureTextField!{
        didSet{
            passwordTextField.secureViewShowMode = .whileEditing
            passwordTextField.getSecureButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

