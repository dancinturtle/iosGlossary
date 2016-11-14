//
//  TermDetailsTableViewController.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/8/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//

import UIKit

class TermDetailsTableViewController : UITableViewController {
    var termObject:NSDictionary?
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        print ("Going back!")
    }
    
    
    @IBOutlet weak var definitionCell: UITableViewCell!
    
    
    @IBOutlet weak var platformCell: UITableViewCell!
    
    @IBOutlet weak var resourcesCell: UITableViewCell!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let object = termObject {
            self.title = String(describing: object["term"]!)
            
            // tableView.rowHeight = UITableViewAutomaticDimension
            // tableView.estimatedRowHeight = 150
            definitionCell.textLabel?.numberOfLines=0
            definitionCell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            platformCell.textLabel?.numberOfLines=0
            platformCell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            resourcesCell.textLabel?.numberOfLines=0
            resourcesCell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping

            
            definitionCell.textLabel?.text = String(describing: object["def"]!)
            print(String(describing: object["def"]!))
            print(String(describing: object["plat"]!))
            print(String(describing: object["doc"]!))
            platformCell.textLabel?.text = String(describing: object["plat"]!)
            resourcesCell.textLabel?.text = String(describing: object["doc"]!)
        }
        
    }
    
    
  
}
