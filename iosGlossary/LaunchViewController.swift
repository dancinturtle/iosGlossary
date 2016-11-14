//
//  ViewController.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/8/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CancelButtonDelegate {
    
    let menuItems = ["Fundamentals", "iOS Basics", "iOS Intermediate", "iOS Advanced", "Review all terms"]
    
   
    @IBOutlet weak var menuTableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuItem")
        cell?.textLabel?.text = menuItems[indexPath.row]
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAll"{
            let navController = segue.destination as! UINavigationController
            let controller = navController.topViewController as! AllTermsTableViewController
            controller.cancelButtonDelegate = self
            
            print ("Going to see all terms")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if indexPath == [0,4]{
            print("Gonna take the segue")
            performSegue(withIdentifier: "toAll", sender: tableView.cellForRow(at: indexPath))
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cancelButtonPressedFrom(controller: UIViewController){
        dismiss(animated: true, completion: nil)
    }
    
    

}

