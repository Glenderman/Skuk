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
    
    let registerURL = "https://student.csc.liv.ac.uk/~sghforbe/v1/register.php"
    
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
        
        let parameters: Parameters = [
            "username": userNameField.text!,
            "password": passwordField.text!,
            "name": nameField.text!,
            "email": emailAddressField.text!,
        ]
        //The following four guard statements add validation to the text fields
        guard let username = userNameField.text, let password = passwordField.text, let name = nameField.text, let email = emailAddressField.text, !username.isEmpty, !password.isEmpty, !name.isEmpty, !email.isEmpty else {
            let alertController = UIAlertController(title: "Error", message: "Fill in all fields", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        guard let usernameCount = userNameField.text?.count, usernameCount > 5 else {
            let alertController = UIAlertController(title: "Error", message: "Username must be at least 6 characters", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        guard let passwordValid = passwordField.text, passwordValid.isPassword else {
            let alertController = UIAlertController(title: "Error", message: "Password must be 8 characters, include a Capital Letter and a Number", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        guard let emailValid = emailAddressField.text, emailValid.isEmail else {
            let alertController = UIAlertController(title: "Error", message: "Email Address must be a valid address", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        Alamofire.request(registerURL, method: .post, parameters: parameters).responseJSON {
            response in
            print(response)
            
            if let result = response.result.value {
                let _ = result as! NSDictionary
                //empties the text in the text fields and popup message shows to say user has been created
                self.nameField.text = ""
                self.userNameField.text = ""
                self.passwordField.text = ""
                self.emailAddressField.text = ""
                
                let alertController = UIAlertController(title: "Done", message: "User Created", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
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
//This extenstion checked that the email and password and valid and the var is called in the guard statements above
extension String {
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isPassword:Bool {
        let passwordRegEx = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
}
