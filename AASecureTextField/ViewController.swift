//
//  ViewController.swift
//  AASecureTextField
//
//  Created by user on 6/1/16.
//  Copyright © 2016 AaoIi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myTextField: AASecureTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }


}

