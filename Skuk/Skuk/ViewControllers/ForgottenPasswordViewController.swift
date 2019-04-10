//
//  ForgottenPasswordViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 07/04/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class ForgottenPasswordViewController: UIViewController {
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "ForgetToLogin", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
