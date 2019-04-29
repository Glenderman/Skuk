//
//  AddPantryViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 25/04/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class AddPantryViewController: UIViewController , UITextFieldDelegate {
    
    var newItem: String = ""
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var cancelBtn: UIBarButtonItem!
    
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
        
        cancelBtn.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Kefa", size: 17)!], for: UIControl.State.normal)
        
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = UIColor(red:1.00, green:0.78, blue:0.15, alpha:1.0)
        }
    }
}
