//
//  ShoppingListViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 25/03/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class ShoppingListViewController: UIViewController {
    
    @IBOutlet var leadingConstraint: NSLayoutConstraint!
    var menuOpen = false
    
    @IBAction func navBtn(_ sender: Any) {
        if !menuOpen {
            leadingConstraint.constant = 150
            menuOpen = true
        } else {
            leadingConstraint.constant = 0
            menuOpen = false
        }
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func mealPlanBtn(_ sender: Any) {
        performSegue(withIdentifier: "ShoppingListToMealPlan", sender: self)
    }
    
    @IBAction func pantryBtn(_ sender: Any) {
        performSegue(withIdentifier: "ShoppingListToPantry", sender: self)
    }
    
    @IBAction func recipeBtn(_ sender: Any) {
        performSegue(withIdentifier: "ShoppingListToRecipeBank", sender: self)
    }
    
    @IBAction func settingsBtn(_ sender: Any) {
        performSegue(withIdentifier: "ShoppingListToSettings", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
