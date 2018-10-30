//
//  MealController.swift
//  Mealtime
//
//  Created by Madison Waters on 10/30/18.
//  Copyright © 2018 Jonah Bergevin. All rights reserved.
//

import Foundation
import CoreData

class MealController {
    
    // MARK: - CRUD Methods
    
    func createMeal(mealName: String) {
        
        let meal = Meal(mealName: mealName)
        saveToPersistentStore()
    }
    
    func addIngredientToMeal(ingredient: String) {
        
        let mealIngredient = Meal(ingredient: ingredient)
        saveToPersistentStore()
    }
    
    func createIngredient(ingredientName: String, haveIngredient: Bool, purchaseDate: Date, quantity: UInt16   ) {
        
        let ingredient = Ingredients(ingredientName: ingredientName,
                                     haveIngredient: haveIngredient,
                                     purchaseDate: purchaseDate,
                                     quantity: quantity)
        
    }
    
    // MARK: - Persistent Store Methods
    
    func saveToPersistentStore() {

        let moc = CoreDataStack.shared.mainContext

        do {
            try moc.save()
        } catch {
            NSLog("Error saving managed object context\(error)")
        }
    }
    
}
