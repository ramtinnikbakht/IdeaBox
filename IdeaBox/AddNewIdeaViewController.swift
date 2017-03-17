//
//  AddNewIdeaViewController.swift
//  IdeaBox
//
//  Created by Ramtin Nikbakht on 3/10/17.
//  Copyright © 2017 Ramtin Nikbakht. All rights reserved.
//

import UIKit

class AddNewIdeaViewController: UIViewController {
    
    var newIdea = String()

    @IBOutlet weak var newIdeaTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showIdeaDetails" {
            if (newIdeaTF.text?.isEmpty)! {
                print("Cannot Leave Idea Empty")
                let alert = UIAlertController(title: "Alert", message: "You left your idea empty.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else {
            newIdea = newIdeaTF.text!
            let destViewController = segue.destination as! IdeaDetailsTableViewController
                destViewController.newIdeaName = newIdea
            }
            
        }
    }


}
