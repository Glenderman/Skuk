//
//  MealPlanViewController.swift
//  Skuk
//
//  Created by Glen Griffiths on 19/03/2019.
//  Copyright © 2019 Glen Griffiths. All rights reserved.
//

import UIKit

class MealPlanViewController: UIViewController {
    
    var menuOpen = false
    var recipes: [Recipe] = []
    
    @IBOutlet var trailingConstraint: NSLayoutConstraint!
    @IBOutlet var mealPlanTable: UITableView!
    
    @IBAction func slideOutMenu(_ sender: Any) {
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
    
    @IBAction func shoppingListBtn(_ sender: Any) {
        performSegue(withIdentifier: "MealPlanToShoppingList", sender: self)
    }
    
    @IBAction func pantryBtn(_ sender: Any) {
        performSegue(withIdentifier: "MealPlanToPantry", sender: self)
    }
    
    @IBAction func recipeBtn(_ sender: Any) {
        performSegue(withIdentifier: "MealPlanToRecipeBank", sender: self)
    }
    
    @IBAction func settingsBtn(_ sender: Any) {
        performSegue(withIdentifier: "MealPlanToSettings", sender: self)
    }
    
    func createArray() -> [Recipe] {
        
        let recipe1 = Recipe(image: #imageLiteral(resourceName: "Cheesecake"), title: "Cheesecake")
        let recipe2 = Recipe(image: #imageLiteral(resourceName: "ChickenPotPie"), title: "Chicken Pot Pie")
        let recipe3 = Recipe(image: #imageLiteral(resourceName: "Lasagna"), title: "Lasagna")
        
        return [recipe1, recipe2, recipe3]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipes = createArray()
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipeCell = recipes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell") as! RecipeCell
        cell.setRecipes(recipe: recipeCell)
        
        return cell
    }
}
