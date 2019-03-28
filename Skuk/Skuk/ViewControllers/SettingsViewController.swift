//
//  SettingsViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 25/03/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var leadingConstraint: NSLayoutConstraint!
    var menuOpen = false
    
    @IBAction func navBtn(_ sender: Any) {
        if !menuOpen {
            leadingConstraint.constant = 130
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
        performSegue(withIdentifier: "SettingsToMealPlan", sender: self)
    }
    
    @IBAction func shoppingListBtn(_ sender: Any) {
        performSegue(withIdentifier: "SettingsToShoppingList", sender: self)
    }
    
    @IBAction func pantryBtn(_ sender: Any) {
        performSegue(withIdentifier: "SettingsToPantry", sender: self)
    }
    
    @IBAction func recipeBankBtn(_ sender: Any) {
        performSegue(withIdentifier: "SettingsToRecipeBank", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont(name: "Kefa", size: 21)!]
    }
}
