//
//  PantryViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 25/03/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class PantryViewController: UIViewController {
    
    @IBOutlet var trailingConstraint: NSLayoutConstraint!
    var menuOpen = false
    
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
        performSegue(withIdentifier: "PantryToMealPlan", sender: self)
    }
    
    @IBAction func shoppingListBtn(_ sender: Any) {
        performSegue(withIdentifier: "PantryToShoppingList", sender: self)
    }
    
    @IBAction func recipeBankBtn(_ sender: Any) {
        performSegue(withIdentifier: "PantryToRecipeBank", sender: self)
    }
    
    @IBAction func settingsBtn(_ sender: Any) {
        performSegue(withIdentifier: "PantryToSettings", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
