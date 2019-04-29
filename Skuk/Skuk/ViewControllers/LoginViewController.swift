//
//  LoginViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 17/03/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    let loginURL = "https://student.csc.liv.ac.uk/~sghforbe/v1/login.php"
    
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBAction func loginBtn(_ sender: UIButton) {
        sender.touchesBegan()
        //getting the username and password
        let parameters: Parameters = [
            "username": usernameField.text!,
            "password": passwordField.text!
        ]
        //connects to service uses loginURl which is a PHP script connected to MYSQL database allowing for login services
        Alamofire.request(loginURL, method: .post, parameters: parameters).responseJSON {
            response in
            print(response)
            
            if let result = response.result.value {
                let jsonData = result as! NSDictionary
                
                if(!(jsonData.value(forKey: "error") as! Bool)) {
                    self.performSegue(withIdentifier: "loginToMealPlan", sender: self)
                } else { //Popup message message
                    let alertController = UIAlertController(title: "Error", message: "Invalid Username or Password", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func registerBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "LoginToRegister", sender: self)
    }
    //This function lets for the next button on the username field take the keyboard to the password field and for the done button on the keyboard to close the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.usernameField {
            self.passwordField.becomeFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }
    //Function allows for user to click outside the keyboard/text fields and close the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameField.delegate = self
        passwordField.delegate = self
        //Changes border color of text fields
        let borderColour = UIColor.gray
        usernameField.layer.borderColor = borderColour.cgColor
        passwordField.layer.borderColor = borderColour.cgColor
    }
}
