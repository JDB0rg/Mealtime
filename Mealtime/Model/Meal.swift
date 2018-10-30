//
//  Meal.swift
//  Mealtime
//
//  Created by Madison Waters on 10/30/18.
//  Copyright © 2018 Jonah Bergevin. All rights reserved.
//

import Foundation
import CoreData

extension Meal {
    
    convenience init(mealName: String,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.mealName = mealName
    }
    
    convenience init(ingredient: String,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.ingredient = ingredient
    }
}

extension Ingredients {
    
    convenience init(ingredientName: String,
                     haveIngredient: Bool = false,
                     purchaseDate: Date = Date(),
                     quantity: UInt16 = 0,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.ingredientName = ingredientName
        self.haveIngredient = haveIngredient
        self.purchaseDate = purchaseDate
        self.quantity = Int16(quantity)
    }
}
