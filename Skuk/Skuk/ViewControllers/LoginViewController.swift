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
    
    let URL_USER_LOGIN = "https://student.csc.liv.ac.uk/~sgggrif2/login.php"
    let defaultValues = UserDefaults.standard
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet var labelMessage: UILabel!
    
    @IBAction func loginBtn(_ sender: UIButton) {
        sender.touchesBegan()
        //getting the username and password
        let parameters: Parameters = [
            "username": usernameField.text!,
            "password": passwordField.text!
        ]
        
        Alamofire.request(URL_USER_LOGIN, method: .post, parameters: parameters).responseJSON {
            response in
            print(response)
            
            if let result = response.result.value {
                let jsonData = result as! NSDictionary
                
                if(!(jsonData.value(forKey: "error") as! Bool)){
                    let user = jsonData.value(forKey: "user") as! NSDictionary
                    
                    //getting user values
                    let userId = user.value(forKey: "id") as! Int
                    let userName = user.value(forKey: "username") as! String
                    let userEmail = user.value(forKey: "email") as! String
                    
                    //saving user values to defaults
                    self.defaultValues.set(userId, forKey: "userid")
                    self.defaultValues.set(userName, forKey: "username")
                    self.defaultValues.set(userEmail, forKey: "useremail")
                    self.performSegue(withIdentifier: "loginToMealPlan", sender: self)
                    self.dismiss(animated: false, completion: nil)
                }
                else {
                    self.labelMessage.text = "Invalid username or password"
                }
            }
        }
    }
    
    @IBAction func registerBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "LoginToRegister", sender: self)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameField.delegate = self
        passwordField.delegate = self
        
        let borderColour = UIColor.gray
        usernameField.layer.borderColor = borderColour.cgColor
        passwordField.layer.borderColor = borderColour.cgColor //sets border colours on textfields
        
        if defaultValues.string(forKey: "username") != nil {
            let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "MealPlanVC") as! MealPlanViewController
            self.navigationController?.pushViewController(profileViewController, animated: true)
        }
    }
}
