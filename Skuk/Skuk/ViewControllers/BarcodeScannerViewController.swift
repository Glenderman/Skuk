//
//  BarcodeScannerViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 09/04/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class BarcodeScannerViewController: UIViewController {
    
    var menuOpen = false
    
    @IBOutlet var trailingConstraint: NSLayoutConstraint!
    
    @IBAction func navBtn(_ sender: Any) {
        if !menuOpen {
            trailingConstraint.constant = -130
            menuOpen = true
        } else {
            trailingConstraint.constant = 0
            menuOpen = false
        }
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func mealPlanBtn(_ sender: Any) {
        performSegue(withIdentifier: "BarcodeScannerToMealPlan", sender: self)
    }
    
    @IBAction func shoppingListBtn(_ sender: Any) {
        performSegue(withIdentifier: "BarcodeScannerToShoppingList", sender: self)
    }
    
    @IBAction func pantryBtn(_ sender: Any) {
        performSegue(withIdentifier: "BarcodeScannerToPantry", sender: self)
    }
    
    @IBAction func recipeBankBtn(_ sender: Any) {
        performSegue(withIdentifier: "BarcodeScannerToRecipeBank", sender: self)
    }
    
    @IBAction func settingsBtn(_ sender: Any) {
        performSegue(withIdentifier: "BarcodeScannerToSettings", sender: self)
    }
    
    @IBAction func doneBtn(_ sender: Any) {
        performSegue(withIdentifier: "BarcodeScannerToShoppingList", sender: self)
    }
    
    @IBAction func manualAddBtn(_ sender: Any) {
        performSegue(withIdentifier: "BarcodeToManual", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
