//
//  IdeaDetailDescriptionViewController.swift
//  IdeaBox
//
//  Created by Ramtin Nikbakht on 3/10/17.
//  Copyright © 2017 Ramtin Nikbakht. All rights reserved.
//

import UIKit

class IdeaDetailDescriptionViewController: UIViewController, UINavigationControllerDelegate {
    
    var selectedDetailCell = String()
    var ideaObject = IdeaObject()

    @IBOutlet weak var detailDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationController?.delegate = self
        self.title = selectedDetailCell
        
        UITextView.appearance().tintColor = UIColor.red     //Set color of cursor red
        detailDescription.becomeFirstResponder()            //Invoke keyboard as soon as view is loaded
        
        
    }
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        if let controller = viewController as? IdeaDetailsTableViewController {
            //controller.newIdeaName = detailDescription.text     //Here you pass the data back to your original view controller
            //controller.newIdeaObject.products = detailDescription.text
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Back Pressed")
        //"Your Idea", "Products", "Services", "Target Market", "Customers", "Market Strategy", "Business Model", "Competitors", "Execution"
        switch selectedDetailCell {
            
        case "Your Idea":
            ideaObject.yourIdea = detailDescription.text
            
        case "Products":
            ideaObject.products = detailDescription.text
            
        case "Services":
            ideaObject.services = detailDescription.text
            
        case "Target Market":
            ideaObject.targetMarket = detailDescription.text
            
        case "Customers":
            ideaObject.customers = detailDescription.text
            
        case "Market Strategy":
            ideaObject.marketStrategy = detailDescription.text
            
        case "Business Model":
            ideaObject.businessModel = detailDescription.text
            
        case "Competitors":
            ideaObject.competitors = detailDescription.text
            
        case "Execution":
            ideaObject.execution = detailDescription.text
            
        default:
            print("There was an error ")
        }
        
        print(detailDescription.text)
    }
     
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
