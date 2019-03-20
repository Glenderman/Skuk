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
    
    @IBAction func loginBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "loginToMealPlan", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.delegate = self
        passwordField.delegate = self
        
        let borderColour = UIColor.gray
        usernameField.layer.borderColor = borderColour.cgColor
        passwordField.layer.borderColor = borderColour.cgColor //sets border colours on textfields
        
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
