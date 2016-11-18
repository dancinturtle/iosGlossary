//
//  StudyCardViewController.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/18/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//


import UIKit

class StudyCardViewController: UIViewController {
    
    var navBarTitle: String?
    var cardIndex = 0
    var cardSide = "top"
    
    var allTerms: [GlossyFlashcard]?
    var currentDeck = [GlossyFlashcard]()
    
    @IBAction func gotItButtonPressed(_ sender: UIButton) {
        print("Got it")
    }
    
    @IBAction func focusButtonPressed(_ sender: UIButton) {
        print("Focusing")
    }
    
    @IBAction func flipButtonPressed(_ sender: UIButton) {
        print("Flipping")
        if(cardSide == "top"){
            cardSide = "back"
        }
        else {
            cardSide = "top"
        }
        displayCard()
    }
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var flashcardLabel: UILabel!
    
    @IBOutlet weak var updateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let navTitle = navBarTitle {
            self.title = navTitle
            if(navTitle == "Focus Stack"){
            print("focus stack")
            }
        else {
            print("full stack")
                if let wholeDeck = allTerms {
                    currentDeck = wholeDeck
                }
            
        }
        }
        displayCard()
        
    }
    
    
    func displayCard(){
        if(cardSide == "top"){
            flashcardLabel.text = currentDeck[cardIndex].term
        }
        else {
            flashcardLabel.text = currentDeck[cardIndex].def
            
        }
        counterLabel.text = "\(cardIndex + 1) / \(currentDeck.count)"
        
    }
    
    



}
