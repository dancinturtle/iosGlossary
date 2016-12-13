//
//  TermDetailsTableViewController.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/8/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//

import UIKit

class TermDetailsTableViewController : UITableViewController {
    var termObject: GlossyFlashcard?
    var cancelButtonDelegate: CancelButtonDelegate?
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        print ("Going back!")
        cancelButtonDelegate?.cancelButtonPressedFrom(controller: self)
    }
    
    
    @IBOutlet weak var definitionCell: UITableViewCell!
    
    
    @IBOutlet weak var platformCell: UITableViewCell!
    
    @IBOutlet weak var resourcesCell: UITableViewCell!
    
    @IBOutlet weak var visitPageButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 150
        self.tableView.rowHeight = UITableViewAutomaticDimension
        if let object = termObject {
            self.title = String(describing: object.term)
            
            // tableView.rowHeight = UITableViewAutomaticDimension
            // tableView.estimatedRowHeight = 150
            definitionCell.textLabel?.numberOfLines=0
            definitionCell.textLabel!.adjustsFontSizeToFitWidth = true
            definitionCell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            platformCell.textLabel?.numberOfLines=0
            platformCell.textLabel!.adjustsFontSizeToFitWidth = true
            platformCell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            resourcesCell.textLabel?.numberOfLines=0
            resourcesCell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping

            
            definitionCell.textLabel?.text = object.def
//            print(String(describing: object["def"]!))
//            print(String(describing: object["plat"]!))
//            print(String(describing: object["doc"]!))
            platformCell.textLabel?.text = object.plat
            visitPageButton.setTitle(String(describing: object.doc), for: .normal)
            visitPageButton.titleLabel!.numberOfLines = 0
            visitPageButton.titleLabel!.adjustsFontSizeToFitWidth = true
            visitPageButton.titleLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping
//            resourcesCell.textLabel?.text = String(describing: object["doc"]!)
        }
        
    }
    
    @IBAction func resourceButtonWasTapped(_ sender: UIButton) {
        print("Resource button tapped")
        if let object = termObject {
            let stringurl = object.doc
            let url = URL(string: stringurl)
            if UIApplication.shared.canOpenURL(url!){
                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                UIApplication.shared.open(url!, options: [:], completionHandler: {
                    (success) in
                    print("Open url: \(success)")
                })
            }

        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if((indexPath.section == 0) && (indexPath.row == 0)){
            return 300
        }
        else {
            return 150
        }
    }
}
