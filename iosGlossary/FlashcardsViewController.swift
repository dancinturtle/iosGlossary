//
//  FlashcardsViewController.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/14/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//

import UIKit

class FlashcardsViewController: UITableViewController {
    
    var navBarTitle: String?
    var focus = false
    var cancelButtonDelegate: CancelButtonDelegate?
    
    
    @IBOutlet weak var fullStackCell: UITableViewCell!
    
    @IBOutlet weak var focusStackCell: UITableViewCell!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullStackCell.textLabel?.text = "All flashcards"
        fullStackCell.textLabel?.textAlignment = .center
        focusStackCell.textLabel?.textAlignment = .center
        focusStackCell.textLabel?.text = "Focus flashcards"
        if let navTitle = navBarTitle {
            self.title = navTitle
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
            cancelButtonDelegate?.cancelButtonPressedFrom(controller: self)
    }
   
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("cell selected! \(indexPath)")
      
        if indexPath == [1,0]{
            focus = true
           
        }
        performSegue(withIdentifier: "studySegue", sender: tableView.cellForRow(at: indexPath))

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let navController = segue.destination as! UINavigationController
        let controller = segue.destination as! StudyViewController
        if focus == true {
            controller.navBarTitle = "Focus stack"
            focus = false
        }
        else {
            controller.navBarTitle = "Full stack"
        }
    }

    
    
    
}
