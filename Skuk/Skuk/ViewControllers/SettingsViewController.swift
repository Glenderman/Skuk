//
//  SettingsViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 25/03/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    

}
