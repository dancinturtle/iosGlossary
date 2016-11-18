//
//  StudyCardViewController.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/18/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//


import UIKit

class StudyCardViewController: UIViewController {
    
    
    @IBAction func gotItButtonPressed(_ sender: UIButton) {
        print("Got it")
    }
    
    @IBAction func focusButtonPressed(_ sender: UIButton) {
        print("Focusing")
    }
    
    @IBAction func flipButtonPressed(_ sender: UIButton) {
        print("Flipping")
    }
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var flashcardLabel: UILabel!
    
    @IBOutlet weak var updateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



}
