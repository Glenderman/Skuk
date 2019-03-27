//
//  MealPlanViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 19/03/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class MealPlanViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var trailingConstraint: NSLayoutConstraint!
    @IBOutlet var leadingConstraint: NSLayoutConstraint!
    var menuOpen = false
    
    @IBAction func slideOutMenu(_ sender: Any) {
        
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
    
    @IBAction func shoppingListBtn(_ sender: Any) {
        performSegue(withIdentifier: "MealPlanToShoppingList", sender: self)
    }
    
    @IBAction func pantryBtn(_ sender: Any) {
        performSegue(withIdentifier: "MealPlanToPantry", sender: self)
    }
    
    @IBAction func recipeBtn(_ sender: Any) {
        performSegue(withIdentifier: "MealPlanToRecipeBank", sender: self)
    }
    
    @IBAction func settingsBtn(_ sender: Any) {
        performSegue(withIdentifier: "MealPlanToSettings", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
