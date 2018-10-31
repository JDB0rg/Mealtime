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
    
    // MARK: - CRUD Properties
    
    var meals: [Meal] {
        return loadMealFromPersistentStore()
    }
    
    var ingredients: [Ingredients] {
        return loadIngredientFromPersistentStore()
    }
    
    // MARK: - CRUD Methods
        
    func createMeal(mealName: String) {
        
        let _ = Meal(mealName: mealName)
        saveToPersistentStore()
    }
    
//    func addIngredientToMealObject() {
//        
//        let meal = Meal(mealName: mealName, ingredient: [String])
//        meal.addIngreditents(ingredient)
//    }
    
    func addIngredientToMeal(mealName: String, ingredient: [String]) {
        
        let _ = Meal(mealName: mealName, ingredient: ingredient)
        saveToPersistentStore()
    }
    
    func createIngredient(ingredientName: String, haveIngredient: Bool, purchaseDate: Date, quantity: UInt16   ) {
        
        let _ = Ingredients(ingredientName: ingredientName,
                                     haveIngredient: haveIngredient,
                                     purchaseDate: purchaseDate,
                                     quantity: quantity)
        saveToPersistentStore()
        
    }
    
    func deleteMeal(meal: Meal) {
        
        CoreDataStack.shared.mainContext.delete(meal)
        saveToPersistentStore()
    }
    
    func deleteIngredient(ingredient: Ingredients) {
        
        CoreDataStack.shared.mainContext.delete(ingredient)
        saveToPersistentStore()
    }
    
    func updateHaveIngredient(ingredients: Ingredients) {
        ingredients.haveIngredient = !ingredients.haveIngredient
        saveToPersistentStore()
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
    
    func loadMealFromPersistentStore() -> [Meal] {
        
        let fetchRequest: NSFetchRequest<Meal> = Meal.fetchRequest()
        let moc = CoreDataStack.shared.mainContext
        
        do {
            return try moc.fetch(fetchRequest)
        } catch {
            print("Error fetching from moc: \(error)")
            return []
        }
    }
    
    func loadIngredientFromPersistentStore() -> [Ingredients] {
        
        let fetchRequest: NSFetchRequest<Ingredients> = Ingredients.fetchRequest()
        let moc = CoreDataStack.shared.mainContext
        
        do {
            return try moc.fetch(fetchRequest)
        } catch {
            print("Error fetching from moc: \(error)")
            return []
        }
    }
    
}
