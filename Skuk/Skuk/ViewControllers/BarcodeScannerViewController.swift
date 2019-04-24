//
//  ManualAddViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 09/04/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class BarcodeScannerViewController: UIViewController {
    
    var menuOpen = false
    
    @IBOutlet var doneBtn: UIBarButtonItem!
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
    
    @IBAction func ChatBotBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "BarcodeToChatBot", sender: self)
    }
    
    @IBAction func SettingsBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "ManualAddToSettings", sender: self)
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case .right:
                leadingConstraint.constant = 0
                trailingConstraint.constant = 0
                UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                    self.view.layoutIfNeeded()
                })
            case .left:
                leadingConstraint.constant = -130
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
        
        doneBtn.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Kefa", size: 20)!],for: .normal)
    }
}
