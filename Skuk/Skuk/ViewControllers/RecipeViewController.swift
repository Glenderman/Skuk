//
//  RecipeViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 18/04/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    
    var menuOpen = false
    
    @IBOutlet var leadingConstraint: NSLayoutConstraint!
    @IBOutlet var trailingConstraint: NSLayoutConstraint!
    

    @IBAction func navBtn(_ sender: Any) {
        if !menuOpen {
            leadingConstraint.constant = -130
            trailingConstraint.constant = -130
            menuOpen = true
        } else {
            leadingConstraint.constant = 0
            trailingConstraint.constant = 0
            menuOpen = false
        }
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func mealPlanBtn(_ sender: UIButton) {
        sender.touchesBegan()
    }
    
    @IBAction func shoppingListBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "RecipeToShoppingList", sender: self)
        sender.touchesBegan()
    }
    
    @IBAction func pantryBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "RecipeToPantry", sender: self)
        sender.touchesBegan()
    }
    
    @IBAction func recipeBankBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "RecipeToRecipeBank", sender: self)
        sender.touchesBegan()
    }
    
    @IBAction func settingsBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "RecipeToSettings", sender: self)
        sender.touchesBegan()
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
