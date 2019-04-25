//
//  ShoppingListViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 25/03/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

var shoppingItems = [String]()

class ShoppingListViewController: UIViewController {
    
    var newItem: String = ""
    var menuOpen = false

    
    @IBOutlet var leadingConstraint: NSLayoutConstraint!
    @IBOutlet var trailingConstraint: NSLayoutConstraint!
    @IBOutlet var shoppingListTable: UITableView!
    
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
        performSegue(withIdentifier: "ShoppingListToMealPlan", sender: self)
    }
    
    @IBAction func shoppingListBtn(_ sender: UIButton) {
        sender.touchesBegan()
    }
    
    @IBAction func pantryBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "ShoppingListToPantry", sender: self)
    }
    
    @IBAction func recipeBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "ShoppingListToRecipeBank", sender: self)
    }
    
    @IBAction func chatBotBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "ShoppingListToChatBot", sender: self)
    }
    
    @IBAction func settingsBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "ShoppingListToSettings", sender: self)
    }
    
    @IBAction func cancel(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func done(segue: UIStoryboardSegue) {
        let addingNewItem = segue.source as! AddItemViewController
        newItem = addingNewItem.newItem
        
        shoppingItems.append(newItem)
        shoppingListTable.reloadData()
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
        shoppingListTable.tableFooterView = UIView(frame: CGRect.zero) //removes empty lines from table
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeRight.direction = .right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeLeft.direction = .left
        
        view.addGestureRecognizer(swipeRight)
        view.addGestureRecognizer(swipeLeft)
    }
}

extension ShoppingListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        cell.textLabel?.text = shoppingItems[indexPath.row]
        cell.textLabel?.font = UIFont(name:"Kefa", size: 17)

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //These two functions allow for cells to be deleted
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingItems.remove(at: indexPath.row)
            shoppingListTable.beginUpdates()
            shoppingListTable.deleteRows(at: [indexPath], with: .fade)
            shoppingListTable.endUpdates()
        }
    }
}
