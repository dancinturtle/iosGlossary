//
//  AllTermsTableViewController.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/8/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//

import UIKit

class AllTermsTableViewController: UITableViewController, CancelButtonDelegate {
    
    
    
    
    let allTerms = CompleteGlossary()
    
    var termToDetail: NSDictionary?

    
    
    
    
    weak var cancelButtonDelegate: CancelButtonDelegate?
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        print ("Cancel Button pressed")
        cancelButtonDelegate?.cancelButtonPressedFrom(controller: self)
        print ("All terms \(allTerms)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTerms.glossary.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "term")
        cell?.textLabel?.text = String(describing: allTerms.glossary[indexPath.row]["term"]!)
        print(allTerms.glossary[indexPath.row]["term"]!)
        return cell!
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        termToDetail = allTerms.glossary[indexPath.row] as NSDictionary
        performSegue(withIdentifier: "detailsSegue", sender: tableView.cellForRow(at: indexPath))
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            print ("Details segue")
            let navController = segue.destination as! UINavigationController
            let controller = navController.topViewController as! TermDetailsTableViewController
            controller.termObject = termToDetail
            controller.cancelButtonDelegate = self
            
        }
    }
    func cancelButtonPressedFrom(controller: UIViewController){
        dismiss(animated: true, completion: nil)
    }
    
        
}
