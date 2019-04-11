//
//  ShoppingListViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 25/03/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class ShoppingListViewController: UIViewController {
    
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
    
    @IBAction func mealPlanBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "ShoppingListToMealPlan", sender: self)
    }
    
    @IBAction func pantryBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "ShoppingListToPantry", sender: self)
    }
    
    @IBAction func recipeBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "ShoppingListToRecipeBank", sender: self)
    }
    
    @IBAction func settingsBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "ShoppingListToSettings", sender: self)
    }
    
    @IBAction func addShoppingList(_ sender: Any) {
        performSegue(withIdentifier: "ShoppingListToBarcodeScanner", sender: self)
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case .right:
                trailingConstraint.constant = 0
                UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                    self.view.layoutIfNeeded()
                })
            case .left:
                trailingConstraint.constant = -130
                UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                    self.view.layoutIfNeeded()
                })
            default:
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeRight.direction = .right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeLeft.direction = .left
        
        view.addGestureRecognizer(swipeRight)
        view.addGestureRecognizer(swipeLeft)
    }
}
