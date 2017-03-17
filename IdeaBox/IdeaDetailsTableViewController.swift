//
//  IdeaDetailsTableViewController.swift
//  IdeaBox
//
//  Created by Ramtin Nikbakht on 3/10/17.
//  Copyright © 2017 Ramtin Nikbakht. All rights reserved.
//

import UIKit
import CoreData

class IdeaDetailsTableViewController: UITableViewController {
    
    var ideaList = [NSManagedObject]()

    let ideaDetailTitles = ["Your Idea", "Products", "Services", "Target Market", "Customers", "Market Strategy", "Business Model", "Competitors", "Execution"]
    
    var newIdeaName = String()
    var selectedCell = String()
    
    var newIdeaObject = IdeaObject()
    
    override func viewWillAppear(_ animated: Bool) {
        print("Idea Name: \(newIdeaName)")
        print("Products \(newIdeaObject.products)")
        print("Services \(newIdeaObject.services)")
        print("Target Market \(newIdeaObject.targetMarket)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = newIdeaName
        
        newIdeaObject.ideaName = newIdeaName
        
        print("Idea Name \(newIdeaObject.ideaName)")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func saveIdea(ideaName: String, yourIdea: String, products: String, services: String, targetMarket: String, customers: String, marketStrategy: String, businessModel: String, competitors: String, execution: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Idea", in: managedContext)
        let idea = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        idea.setValue(ideaName, forKey: "ideaName")
        idea.setValue(yourIdea, forKey: "yourIdea")
        idea.setValue(products, forKey: "products")
        idea.setValue(services, forKey: "services")
        idea.setValue(targetMarket, forKey: "targetMarket")
        idea.setValue(customers, forKey: "customers")
        idea.setValue(marketStrategy, forKey: "marketStrategy")
        idea.setValue(businessModel, forKey: "businessModel")
        idea.setValue(competitors, forKey: "competitors")
        idea.setValue(execution, forKey: "execution")
        
        do {
            try managedContext.save()
            ideaList.append(idea)
        } catch {
            print("Error")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ideaDetailTitles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ideadetailcells", for: indexPath)

        cell.textLabel?.text = ideaDetailTitles[indexPath.row]

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        selectedCell = cell.textLabel!.text!
        performSegue(withIdentifier: "showDetailDescription", sender: self)
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

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Segue when an idea detail cell is selected
        if segue.identifier == "showDetailDescription" {
            
            let destinationViewController = segue.destination as! IdeaDetailDescriptionViewController
            destinationViewController.selectedDetailCell = selectedCell
            destinationViewController.ideaObject = newIdeaObject
        }
        //Segue when save bar button is pressed
        if segue.identifier == "saveIdeaShowHome" {
            
            //saveIdea(ideaName: newIdeaName, yourIdea: newIdeaObject.yourIdea, products: newIdeaObject.products)
            saveIdea(ideaName: newIdeaName, yourIdea: newIdeaObject.yourIdea, products: newIdeaObject.products, services: newIdeaObject.services, targetMarket: newIdeaObject.targetMarket, customers: newIdeaObject.customers, marketStrategy: newIdeaObject.marketStrategy, businessModel: newIdeaObject.businessModel, competitors: newIdeaObject.competitors, execution: newIdeaObject.execution)
            print("Going")
            //let homeDestinationViewController: HomeTableViewController = segue.destination as! HomeTableViewController
            
            
        }
    }


}
