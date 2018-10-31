//
//  MealPlanDetailViewController.swift
//  Mealtime
//
//  Created by Madison Waters on 10/30/18.
//  Copyright © 2018 Jonah Bergevin. All rights reserved.
//

import UIKit

class MealPlanDetailViewController: UIViewController {
    
    @IBOutlet weak var mealPlanTextField: UITextField!
    @IBOutlet weak var addIngredientTextField: UITextField!
    
    @IBAction func cancelPopOver(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
        // This or the one above it should reload the MealPlan TableView to show new values
    }
    
    @IBAction func addMealButtonTapped(_ sender: Any) {
        guard let mealName = mealPlanTextField.text else { return }
        
        if let meal = meal {
            meal.mealName = mealName
        } else {
            let _ = Meal(mealName: mealName)
            mealController?.createMeal(mealName: mealName)
        }
        mealPlanTextField.text = ""
        //updateViews()
    }
    
    @IBAction func addIngredientButtonTapped(_ sender: Any) {
        guard let mealName = mealPlanTextField.text,
            let ingredientName = addIngredientTextField.text else { return }
        
        if let meal = meal,
            let ingredient = ingredient
             {
            meal.mealName = mealName
            ingredient.ingredientName = ingredientName
        } else {
            let _ = Meal(mealName: mealName, ingredient: [ingredientName])
            mealController?.addIngredientToMeal(mealName: mealName, ingredient: [ingredientName])
        }
        addIngredientTextField.text = ""
        mealPlanTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //updateViews()
        
    }
    
    func updateViews() {
        guard let meal = meal,
            let ingredient = ingredient else { return }
        
        mealPlanTextField.text = meal.mealName
        addIngredientTextField.text = ingredient.ingredientName
    }
    
    // MARK: - Properties
    var meal: Meal? {
        didSet{
            updateViews()
        }
    }
    
    var ingredient: Ingredients? {
        didSet{
            updateViews()
        }
    }
    
    var mealController: MealController?
}

