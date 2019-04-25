//
//  BarcodeScannerViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 09/04/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, UITextFieldDelegate {
    
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
        if segue.identifier == "doneSegue" {
            newItem = addTextField.text!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTextField.delegate = self
        addTextField.layer.borderColor = UIColor.gray.cgColor
        //self.view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.6)
    }
}
