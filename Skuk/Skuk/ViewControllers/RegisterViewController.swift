//
//  RegisterViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 07/04/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBAction func cancelBtn(_ sender: Any) {
        performSegue(withIdentifier: "RegisterToLogin", sender: self)
    }
    
    @IBAction func registerBtn(_ sender: Any) {
        performSegue(withIdentifier: "RegisterToLogin", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
