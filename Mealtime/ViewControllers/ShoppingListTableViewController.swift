//
//  ShoppingListTableViewController.swift
//  Mealtime
//
//  Created by Madison Waters on 10/30/18.
//  Copyright © 2018 Jonah Bergevin. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController {
    
    
    @IBOutlet weak var ShoppingListTextField: UITextField!
    
    @IBAction func addShoppingListItemButtonTapped(_ sender: Any) {
        guard let ingredientName = ShoppingListTextField.text else { return }
        
        mealController?.createIngredient(ingredientName: ingredientName, haveIngredient: true, purchaseDate: Date(), quantity: 1)
        ShoppingListTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let available = "Available Ingredients"
        return available
        
    }
    
//    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        let buy = "Cheese"
//        return buy
//    }
//    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let mealDetailSection = UIView()
//        mealDetailSection.backgroundColor = UIColor.lightGray
//        
//        return mealDetailSection
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return mealController?.ingredients.count ?? 0
        return mealController?.meals.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCell", for: indexPath)

        //let ingredients = mealController?.ingredients[indexPath.row]
        let ingredients = mealController?.meals[indexPath.row]
        //cell.textLabel?.text = ingredients?.ingredientName
        cell.textLabel?.text = ingredients?.mealName

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    private func updateViews() {
        guard let ingredients = ingredients else { return }
        
        ShoppingListTextField.text = ingredients.ingredientName
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    var ingredients: Ingredients?
    
    var mealController: MealController?
}
