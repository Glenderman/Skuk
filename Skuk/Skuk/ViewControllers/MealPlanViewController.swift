//
//  MealPlanViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 19/03/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

var recipes: [Recipe] = []

class MealPlanViewController: UIViewController {
    
    var menuOpen = false
    
    @IBOutlet var leadingConstraint: NSLayoutConstraint!
    @IBOutlet var trailingConstraint: NSLayoutConstraint!
    @IBOutlet var mealPlanTable: UITableView!
    
    @IBAction func slideOutMenu(_ sender: Any) {
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
        sender.touchesBegan()
        performSegue(withIdentifier: "MealPlanToShoppingList", sender: self)
    }
    
    @IBAction func pantryBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "MealPlanToPantry", sender: self)
    }
    
    @IBAction func recipeBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "MealPlanToRecipeBank", sender: self)
    }
    
    @IBAction func BotBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "MealPlanToChatBot", sender: self)
    }
    
    @IBAction func settingsBtn(_ sender: UIButton) {
        sender.touchesBegan()
        performSegue(withIdentifier: "MealPlanToSettings", sender: self)
    }
    
    func createArray() -> [Recipe] {
        let recipe1 = Recipe(image: #imageLiteral(resourceName: "Cheesecake"), title: "Cheesecake")
        let recipe2 = Recipe(image: #imageLiteral(resourceName: "ChickenPotPie"), title: "Chicken Pot Pie")
        let recipe3 = Recipe(image: #imageLiteral(resourceName: "Lasagna"), title: "Lasagna")
        
        return [recipe1, recipe2, recipe3]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MealPlanToRecipe", sender: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let detailVC = segue.destination as! RecipeViewController
//    }
    
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
        mealPlanTable.tableFooterView = UIView(frame: CGRect.zero)
        recipes = createArray()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeRight.direction = .right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        swipeLeft.direction = .left
        
        view.addGestureRecognizer(swipeRight)
        view.addGestureRecognizer(swipeLeft)
    }
}

class RecipeCell: UITableViewCell {
    
    @IBOutlet var mealImg: UIImageView!
    @IBOutlet var mealLbl: UILabel!
    
    func setRecipes(recipe: Recipe) {
        mealImg.image = recipe.image
        mealLbl.text = recipe.title
    }
}

extension MealPlanViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            recipes.remove(at: indexPath.row)
            mealPlanTable.beginUpdates()
            mealPlanTable.deleteRows(at: [indexPath], with: .fade)
            mealPlanTable.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipeCell = recipes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell") as! RecipeCell
        cell.setRecipes(recipe: recipeCell)
        
        return cell
    }
}
