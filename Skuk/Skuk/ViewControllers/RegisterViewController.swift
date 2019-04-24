//
//  RegisterViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 07/04/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    let URL_USER_REGISTER = "https://student.csc.liv.ac.uk/~sgggrif2/v1/register.php"
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var userNameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var emailAddressField: UITextField!
    @IBOutlet var errorMessage: UILabel!
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "RegisterToLogin", sender: self)
    }
    
    @IBAction func registerBtn(_ sender: UIButton) {
        sender.touchesBegan()
        
        let parameters: Parameters = [
            "username": userNameField.text!,
            "password": passwordField.text!,
            "name": nameField.text!,
            "email": emailAddressField.text!,
        ]
        
        guard let username = userNameField.text, let password = passwordField.text, let name = nameField.text, let email = emailAddressField.text, !username.isEmpty, !password.isEmpty, !name.isEmpty, !email.isEmpty else {
            errorMessage.text = "Required parameters are missing"
            return }
        
        guard let usernameCount = userNameField.text?.count, usernameCount > 6 else {
            errorMessage.text = "Username length must be at least 6 characters"
            return }
        
        guard let passwordCount = passwordField.text?.count, passwordCount > 6 else {
            errorMessage.text = "Password length must at least 6 characters"
            return }
        
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON {
            response in
            print(response)
            
            if let result = response.result.value {
                let jsonData = result as! NSDictionary
                
                self.errorMessage.text = jsonData.value(forKey: "message") as! String?
                self.nameField.text = ""
                self.userNameField.text = ""
                self.passwordField.text = ""
                self.emailAddressField.text = ""
            }
        }
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
        self.view.endEditing(true)
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
