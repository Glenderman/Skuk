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
    //This allows for the menu to slide out/in on touch of the hamburger menu icon
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
        let recipe4 = Recipe(image: #imageLiteral(resourceName: "ChickenChowMein"), title: "Chicken Chow Mein")
        let recipe5 = Recipe(image: #imageLiteral(resourceName: "Brownies"), title: "Brownies")
        let recipe6 = Recipe(image: #imageLiteral(resourceName: "Prawns"), title: "Coronation Prawns on Toasted Naan")
        let recipe7 = Recipe(image: #imageLiteral(resourceName: "TurkeyNoodles"), title: "Crispy Chilli Turkey Noodles")
        let recipe8 = Recipe(image: #imageLiteral(resourceName: "Carrot Cake"), title: "Carrot Cake Granola")
        let recipe9 = Recipe(image: #imageLiteral(resourceName: "FrenchToastie"), title: "French Toastie")
        let recipe10 = Recipe(image: #imageLiteral(resourceName: "Salmon"), title: "Salmon")
        let recipe11 = Recipe(image: #imageLiteral(resourceName: "CroqueMonsieur"), title: "Croque Monsieur")
        let recipe12 = Recipe(image: #imageLiteral(resourceName: "DuckWrap"), title: "Duck Wrap")
        let recipe13 = Recipe(image: #imageLiteral(resourceName: "Black Bean"), title: "Black Bean–Stuffed Sweet Potatoes")
        let recipe14 = Recipe(image: #imageLiteral(resourceName: "PestoChickenBake"), title: "Pesto Chicken Bake")
        
        return [recipe1, recipe2, recipe3, recipe4, recipe5, recipe6, recipe7, recipe8, recipe9, recipe10, recipe11, recipe12, recipe13, recipe14]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MealPlanToRecipe", sender: nil)
    }
    
    //Allows for swiping left and right to close the menu
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
        //These lines below use the handleSwipe function so that the swipe works to open the menu
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
//Extension allows for manuipulation of table
extension MealPlanViewController: UITableViewDataSource, UITableViewDelegate {
    //The number of rows is the number of items in recipes array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    //Following two functions allow for rows to be deleted
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
