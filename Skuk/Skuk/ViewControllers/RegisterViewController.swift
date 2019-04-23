//
//  RegisterViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 07/04/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var userNameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var emailAddressField: UITextField!
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "RegisterToLogin", sender: self)
    }
    
    @IBAction func registerBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "RegisterToLogin", sender: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.nameField {
            self.userNameField.becomeFirstResponder()
        }
        if textField == self.userNameField {
            self.passwordField.becomeFirstResponder()
        }
        if textField == self.passwordField {
            self.emailAddressField.becomeFirstResponder()
        }
        
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //if the user touches outside the textfields/keyboard then the keyboard closes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        userNameField.delegate = self
        passwordField.delegate = self
        emailAddressField.delegate = self
        
        let borderColour = UIColor.gray
        nameField.layer.borderColor = borderColour.cgColor
        userNameField.layer.borderColor = borderColour.cgColor
        passwordField.layer.borderColor = borderColour.cgColor
        emailAddressField.layer.borderColor = borderColour.cgColor
    }
}
