//
//  MealPlanTableViewCell.swift
//  Mealtime
//
//  Created by Madison Waters on 10/31/18.
//  Copyright © 2018 Jonah Bergevin. All rights reserved.
//

import UIKit

class MealPlanTableViewCell: UITableViewCell {

    private func updateViews() {
        
        //guard let meal = meal else { return }
        
        //mealPlanTextField.text = meal.mealName
        
        
    }

    // MARK: - Properties
    var ingredient: Ingredients? {
        didSet{
            updateViews()
        }
    }
    
    var meal: Meal? {
        didSet{
            updateViews()
        }
    }
    
    let mealPlanDetailViewController: MealPlanDetailViewController? = nil
}
