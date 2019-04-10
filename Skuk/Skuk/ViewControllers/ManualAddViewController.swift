//
//  ManualAddViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 09/04/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class ManualAddViewController: UIViewController {
    
    var menuOpen = false
    
    @IBOutlet var doneBtn: UIBarButtonItem!
    
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
    
    @IBAction func doneBtn(_ sender: Any) {
        performSegue(withIdentifier: "ManualAddToShoppingList", sender: self)
    }
    
    @IBAction func MealPlanBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "ManualAddToMealPlan", sender: self)
    }
    
    @IBAction func ShoppingListBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "ManualAddToShoppingList", sender: self)
    }
    
    @IBAction func PantryBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "ManualAddToPantry", sender: self)
    }
    
    @IBAction func RecipeBankBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "ManualAddToRecipeBank", sender: self)
    }
    
    @IBAction func SettingsBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "ManualAddToSettings", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneBtn.setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont(name: "Kefa", size: 20)!],for: .normal)
    }
}
