//
//  BarcodeScannerViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 09/04/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var addTextField: UITextField!
    
    @IBAction func addBtn(_ sender: Any) {
        addTextField.text = ""
        view.endEditing(true)
    }
    
    @IBAction func barcodeScannerBtn(_ sender: Any) {
        performSegue(withIdentifier: "AddToBarcode", sender: self)
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTextField.delegate = self
        addTextField.layer.borderColor = UIColor.gray.cgColor
        self.view.backgroundColor = UIColor(red: 0.49, green: 0.49, blue: 0.49, alpha: 0.6)
    }
}
