//
//  LoginViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 17/03/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.delegate = self
        passwordField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //if statement allows for when user clicks next button on username textfield then it transfers to password textfield
        if textField == self.usernameField {
            self.passwordField.becomeFirstResponder()
        }
        textField.resignFirstResponder() //when user clicks done button on keyboard the keyboard closes
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //if the user touches outside the textfields/keyboard then the keyboard closes
        
        
    }
    


}