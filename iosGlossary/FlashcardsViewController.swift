//
//  FlashcardsViewController.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/14/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//

import UIKit

class FlashcardsViewController: UIViewController {
    
    var navBarTitle: String?
    var focus = false
    var cancelButtonDelegate: CancelButtonDelegate?
    var flashcardDelegate: FlashCardDelegate?
    var allTerms: [GlossyFlashcard]?
    
  
    @IBAction func allFlashcardsPressed(_ sender: UIButton) {
        focus = false
        performSegue(withIdentifier: "studyTwoCollection", sender: self)
        print("All flash")
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        cancelButtonDelegate?.cancelButtonPressedFrom(controller: self)
    }
    

    @IBAction func focusFlashcardsPressed(_ sender: UIButton) {
        focus = true
        performSegue(withIdentifier: "studyTwoCollection", sender: self)
        print("Focusing")
    }
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
                if let navTitle = navBarTitle {
            self.title = navTitle
        }
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "studyTwoCollection"{
            
            let controller = segue.destination as! StudyCollectionViewController
            if let wholeDeck = allTerms {
                controller.allTerms = wholeDeck
            }
            controller.section = self.title
            if focus == true {
                print("Going to focus stack")
                controller.navBarTitle = "Focus stack"
                focus = false
            }
            else {
                print("Going to all stacks")
                controller.navBarTitle = "Full stack"
            
            }
        }
    }
}
