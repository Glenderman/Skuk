//
//  PantryViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 25/03/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class PantryViewController: UIViewController {
    
    var pantryItems: [String] = ["Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen","Glen"]
    var menuOpen = false
    
    @IBOutlet var pantryTable: UITableView!
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
        performSegue(withIdentifier: "PantryToMealPlan", sender: self)
    }
    
    @IBAction func shoppingListBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "PantryToShoppingList", sender: self)
    }
    
    @IBAction func recipeBankBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "PantryToRecipeBank", sender: self)
    }
    
    @IBAction func settingsBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "PantryToSettings", sender: self)
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
        pantryTable.tableFooterView = UIView(frame: CGRect.zero)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeRight.direction = .right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeLeft.direction = .left
        
        view.addGestureRecognizer(swipeRight)
        view.addGestureRecognizer(swipeLeft)
    }
}

extension PantryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pantryItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pantryItem = pantryItems[indexPath.row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "pantryItem");
        cell.textLabel?.text = pantryItem
        cell.textLabel?.font = UIFont(name:"Kefa", size: 17)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            pantryItems.remove(at: indexPath.row)
            pantryTable.beginUpdates()
            pantryTable.deleteRows(at: [indexPath], with: .fade)
            pantryTable.endUpdates()
        }
    }
}
