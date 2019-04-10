//
//  RecipeBankViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 25/03/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class RecipeBankViewController: UIViewController {
    
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
    
    @IBAction func mealPlanBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "RecipeBankToMealPlan", sender: self)
    }
    
    @IBAction func shoppingListBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "RecipeBankToShoppingList", sender: self)
    }
    
    @IBAction func pantryBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "RecipeBankToPantry", sender: self)
    }
    
    @IBAction func settingsBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "RecipeBankToSettings", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
