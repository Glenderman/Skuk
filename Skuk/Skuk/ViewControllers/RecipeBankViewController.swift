//
//  RecipeBankViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 25/03/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class RecipeBankViewController: UIViewController {
    
    var recipes: [Recipe] = []
    var menuOpen = false
    
    @IBOutlet var recipeBankTable: UITableView!
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
    
    @IBAction func recipeBankBtn(_ sender: UIButton) {
        sender.touchesBegan()
    }
    
    @IBAction func chatBotBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "RecipeBankToChatBot", sender: self)
    }
    
    @IBAction func settingsBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "RecipeBankToSettings", sender: self)
    }
    
    @IBAction func cancel(segue: UIStoryboardSegue) {
        
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
    
    func createArray() -> [Recipe] {
        let recipe1 = Recipe(image: #imageLiteral(resourceName: "Cheesecake"), title: "Cheesecake")
        let recipe2 = Recipe(image: #imageLiteral(resourceName: "ChickenPotPie"), title: "Chicken Pot Pie")
        let recipe3 = Recipe(image: #imageLiteral(resourceName: "Lasagna"), title: "Lasagna")
        
        return [recipe1, recipe2, recipe3]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "RecipeBankToRecipe", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeBankTable.tableFooterView = UIView(frame: CGRect.zero)
        recipes = createArray()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeRight.direction = .right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeLeft.direction = .left
        
        view.addGestureRecognizer(swipeRight)
        view.addGestureRecognizer(swipeLeft)
    }
}

class RecipeMealCell: UITableViewCell {
    
    @IBOutlet var mealImg: UIImageView!
    @IBOutlet var mealLbl: UILabel!
    
    func setRecipes(recipe: Recipe) {
        mealImg.image = recipe.image
        mealLbl.text = recipe.title
    }
}

extension RecipeBankViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipeCell = recipes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeBankCell") as! RecipeMealCell
        cell.setRecipes(recipe: recipeCell)
        
        return cell
    }
}
