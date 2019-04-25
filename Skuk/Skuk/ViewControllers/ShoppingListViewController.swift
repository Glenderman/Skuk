//
//  ShoppingListViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 25/03/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

var shoppingItems: [String] = []

class ShoppingListViewController: UIViewController, UITextFieldDelegate {
    
    var menuOpen = false
    
    @IBOutlet var leadingConstraint: NSLayoutConstraint!
    @IBOutlet var trailingConstraint: NSLayoutConstraint!
    @IBOutlet var shoppingListTable: UITableView!
    @IBOutlet var addItemField: UITextField!
    
    //Add function button adds text to array then adds it to table
    @IBAction func addItemBtn(_ sender: Any) {
        if (addItemField.text != "") {
            shoppingItems.append(addItemField.text!)
            let indexPath = IndexPath(row: shoppingItems.count - 1, section: 0)
            shoppingListTable.beginUpdates()
            shoppingListTable.insertRows(at: [indexPath], with: .fade)
            shoppingListTable.endUpdates()
        }
        addItemField.text = ""
        view.endEditing(true)
    }
    
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addItemField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Add btn in nav bar calls popupview
    @IBAction func addBtn(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpVC") as! AddItemViewController
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingListTable.tableFooterView = UIView(frame: CGRect.zero) //removes empty lines from table
        addItemField.delegate = self
        
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
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "item");
        cell.textLabel?.text = shoppingItems[indexPath.row]
        cell.textLabel?.font = UIFont(name:"Kefa", size: 17)

        return cell
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
