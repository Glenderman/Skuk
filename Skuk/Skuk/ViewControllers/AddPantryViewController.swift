//
//  AddPantryViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 25/04/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class AddPantryViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet var doneBtn: UIBarButtonItem!
    @IBOutlet var cancelBtn: UIBarButtonItem!
    
    var newItem: String = ""
    @IBOutlet var addTextField: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "donePantrySegue" {
            newItem = addTextField.text!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTextField.delegate = self
        addTextField.layer.borderColor = UIColor.gray.cgColor
        
        doneBtn.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Kefa", size: 17)!], for: UIControl.State.normal)
        cancelBtn.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Kefa", size: 17)!], for: UIControl.State.normal)
    }
}

