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
    
  
    @IBAction func allFlashcardsPressed(_ sender: UIButton) {
        focus = false
        performSegue(withIdentifier: "studySegue", sender: self)
        print("All flash")
    }

    @IBAction func focusFlashcardsPressed(_ sender: UIButton) {
        focus = true
         performSegue(withIdentifier: "studySegue", sender: self)
        print("Focusing")
    }
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
                if let navTitle = navBarTitle {
            self.title = navTitle
        }
    }
    
//    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
//            cancelButtonDelegate?.cancelButtonPressedFrom(controller: self)
//    }
//   
//   //    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
////        let navController = segue.destination as! UINavigationController
//        let controller = segue.destination as! StudyViewController
//        if focus == true {
//            print("Going to focus stack")
////            controller.navBarTitle = "Focus stack"
////            focus = false
//        }
//        else {
//            print("Going to all stacks")
////            controller.navBarTitle = "Full stack"
//        }
//    }
//
    
    
    
}
