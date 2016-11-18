//
//  ViewController.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/8/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CancelButtonDelegate {
    
    // Put all the terms here on launch view controller. This controller can pass the deck around to where it needs to go.
    
    
    let menuItems = ["Fundamentals", "iOS Basics", "iOS Intermediate", "iOS Advanced", "Review all terms"]
    var stringForTitle: String?
    
    
    // all terms will be an array of all the flashcards we make in View Did Load
    var allTerms = [GlossyFlashcard]()
    
   
    @IBOutlet weak var menuTableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
        allTerms = [
            GlossyFlashcard(term: "compiled vs interpreted", def: "Compiled languages have to be translated completely before running while interpreted languages get translated on the fly as the program is getting read. Swift is a compiled language.", plat: "Fundamentals - Swift - Playground", doc: "https://en.wikipedia.org/wiki/Swift_(programming_language)"),
            GlossyFlashcard(term:"playground", def: "Playground is an interactive environment within Xcode. The left side is the code editor and the right side shows code output.", plat: "Fundamentals - Swift - Playground", doc: "https://developer.apple.com/swift/blog/?id=35"),
            GlossyFlashcard(term:"Statically Typed", def: "Swift is statically typed so it forces the developer to be more conscious about types and it also allows the computer to run more efficiently by allocating just enough space for each variable.", plat: "Fundamentals - Swift - Let & Var", doc: "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-ID309")
        ]

        
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
    
            controller.allTerms = allTerms
            
            
            print ("Going to see all terms")
        }
        else if segue.identifier == "flashcardsSegue"{
            let navController = segue.destination as! UINavigationController
            let controller = navController.topViewController as! FlashcardsViewController
            controller.cancelButtonDelegate = self
//            controller.flashcardDelegate = FlashCardDelegate(AllTermsTableViewController)
            controller.navBarTitle = stringForTitle
            controller.allTerms = allTerms
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if indexPath == [0,4]{
            performSegue(withIdentifier: "toAll", sender: tableView.cellForRow(at: indexPath))
        }
        else {
            if indexPath == [0,0]{
                stringForTitle = "Fundamentals"
            }
            else if indexPath == [0,1]{
                stringForTitle = "iOS Basics"
            }
            else if indexPath == [0,2]{
                stringForTitle = "iOS Intermediate"
            }
            else if indexPath == [0,3]{
                stringForTitle = "iOS Advanced"
            }
            performSegue(withIdentifier: "flashcardsSegue", sender: tableView.cellForRow(at: indexPath))
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

