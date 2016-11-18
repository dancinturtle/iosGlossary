//
//  StudyViewController.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/14/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//

import UIKit
import CoreData


class StudyViewController: UIViewController {
    
    
    
    @IBOutlet weak var flipButton: UIButton!
    
    @IBAction func flipButtonWasTapped(_ sender: UIButton) {
        updateLabel.text = ""
        if flashcard.text == currentDeck[cardIndex]["term"] {
            flashcard.text = currentDeck[cardIndex]["def"]
            platLabel.isHidden = false
            platLabel.text = currentDeck[cardIndex]["plat"]
            linkToDocButton.isHidden = false
            linkToDocButton.isEnabled = true
        }
        else {
            flashcard.text = currentDeck[cardIndex]["term"]
            platLabel.isHidden = true
            linkToDocButton.isHidden = true
            linkToDocButton.isEnabled = false
        }
        

        
    }
    @IBOutlet weak var updateLabel: UILabel!
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var navBarTitle: String?
    var allFlashcards = CompleteGlossary().glossary
    var currentDeck = [Dictionary<String, String>]()
    var cardIndex = 0
    var focusCards = [Flashcard]()
    
    
    @IBOutlet weak var gotItButton: UIButton!
    
    @IBOutlet weak var focusButton: UIButton!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        flipButton.isEnabled = true
        updateLabel.text = ""
        fetchFocusCards()
        platLabel.isHidden = true
        linkToDocButton.isHidden = true
        linkToDocButton.isEnabled = false
        
        
        self.view.addGestureRecognizer(rightSwipe)
        self.view.addGestureRecognizer(leftSwipe)
//        self.view.addGestureRecognizer(tap)
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        
        rightSwipe.direction = UISwipeGestureRecognizerDirection.right
        print (UISwipeGestureRecognizerDirection.right)
        
        
        if let navTitle = navBarTitle {
            self.title = navTitle
        }
        if self.title == "Full stack" {
            focusButton.isHidden = false
            focusButton.isEnabled = true
            gotItButton.isHidden = true
            gotItButton.isEnabled = false
            currentDeck = allFlashcards
            shuffleFlashcards()
            displayCard()
            rightSwipe.addTarget(self, action: #selector(StudyViewController.handleSwipes(_:)))
            leftSwipe.addTarget(self, action: #selector(StudyViewController.handleSwipes(_:)))
//            tap.addTarget(self, action: #selector(StudyViewController.handleTap(_:)))
            
            
        }
            
        else {
            focusButton.isHidden = true
            focusButton.isEnabled = false
            gotItButton.isHidden = false
            gotItButton.isEnabled = true
//            fetchFocusCards()
            if(focusCards.count == 0){
                flashcard.text = "No cards in deck."
                flipButton.isEnabled = false
                gotItButton.isEnabled = false
                gotItButton.isHidden = true
                platLabel.isHidden = true
                linkToDocButton.isHidden = true
                linkToDocButton.isEnabled = false
                flashcardCounter.text = ""
            }
            else {
                for card in focusCards {
                    for flashcard in allFlashcards {
                        if card.term == flashcard["term"] {
                            currentDeck.append(flashcard)
                            break
                        }
                    }
                }
                shuffleFlashcards()
                displayCard()
                rightSwipe.addTarget(self, action: #selector(StudyViewController.handleSwipes(_:)))
                leftSwipe.addTarget(self, action: #selector(StudyViewController.handleSwipes(_:)))
//                tap.addTarget(self, action: #selector(StudyViewController.handleTap(_:)))
                
            }
        }
        
        
        
    }

    
    
    @IBAction func focusButtonTapped(_ sender: UIButton) {
        var found = false
        for card in focusCards {
            if card.term == currentDeck[cardIndex]["term"]{
                updateLabel.text = "In focus"
                found = true
            }
        }
        if found == false {
            
        
        updateLabel.text = "Added to focus"
        let card = NSEntityDescription.insertNewObject(forEntityName: "Flashcard", into: managedObjectContext) as! Flashcard
        card.term = currentDeck[cardIndex]["term"]
        card.focus = true
        if managedObjectContext.hasChanges {
                    do {
                        try managedObjectContext.save()
                        print("Success")
                    } catch {
                        print("\(error)")
                    }
                }
        fetchFocusCards()
        print("Focusing")
        }
    }
    
    
    @IBAction func gotItButtonTapped(_ sender: UIButton) {
        updateLabel.text = "Removed from focus"
        if currentDeck.count < 1 {
            return
        }
        let termToDelete = currentDeck[cardIndex]["term"]
        
        for card in focusCards {
            if card.term == termToDelete {
                managedObjectContext.delete(card)
                break
            }
        }
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Success")
            } catch {
                print("\(error)")
            }
        }
        currentDeck.remove(at: cardIndex)
        if cardIndex > currentDeck.count - 1 {
            cardIndex = currentDeck.count - 1
        }
        if cardIndex >= 0 {
            displayCard()
        }
        else {
            flashcard.text = "No more cards."
            flipButton.isEnabled = false
            gotItButton.isHidden = true
            gotItButton.isEnabled = false
            platLabel.isHidden = true
            linkToDocButton.isHidden = true
            
            linkToDocButton.isEnabled = false
            flashcardCounter.text = ""
            print("No more focus cards")
        }
        print("Got it!")
    }
    
    
    
    @IBOutlet weak var linkToDocButton: UIButton!
    
    @IBOutlet weak var platLabel: UILabel!
    
    @IBAction func linkToDocs(_ sender: UIButton) {
        updateLabel.text = ""
        let stringurl = String(describing: currentDeck[cardIndex]["doc"]!)
        let url = URL(string: stringurl)
        if UIApplication.shared.canOpenURL(url!){
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            UIApplication.shared.open(url!, options: [:], completionHandler: {
                (success) in
                print("Open url: \(success)")
            })
        }

    }
   
    
    
    
    @IBOutlet weak var flashcardCounter: UILabel!
    
    @IBOutlet weak var flashcard: UILabel!
    let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(StudyViewController.handleSwipes(_:)))
    let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(StudyViewController.handleSwipes(_:)))
//    let tap = UITapGestureRecognizer(target: self, action: #selector(StudyViewController.handleTap(_:)))

//    
//    func handleTap(_ gesture: UITapGestureRecognizer){
//        updateLabel.text = ""
//
//        print("Tapping!!!")
//        if flashcard.text == currentDeck[cardIndex]["term"] {
//            flashcard.text = currentDeck[cardIndex]["def"]
//            platLabel.isHidden = false
//            platLabel.text = currentDeck[cardIndex]["plat"]
//            linkToDocButton.isHidden = false
//            linkToDocButton.isEnabled = true
//                    }
//        else {
//            flashcard.text = currentDeck[cardIndex]["term"]
//            platLabel.isHidden = true
//            linkToDocButton.isHidden = true
//            linkToDocButton.isEnabled = false
//        }
//        
//    }

    func handleSwipes(_ gesture: UISwipeGestureRecognizer){
        platLabel.isHidden = true
        linkToDocButton.isHidden = true
        linkToDocButton.isEnabled = false
        updateLabel.text = ""

        if currentDeck.count == 0{
            print("no cards, swipe disabled")
            return
        }

        if gesture.direction == UISwipeGestureRecognizerDirection.left {
                if cardIndex < currentDeck.count-1 {
                    cardIndex += 1
                }
                else {
                    cardIndex = 0
            }
            }
            else if gesture.direction == UISwipeGestureRecognizerDirection.right{
                if cardIndex > 0 {
                    cardIndex -= 1
                }
                else {
                    cardIndex = currentDeck.count-1
            }
            }
        displayCard()
    }
    
    func displayCard(){
        

        flashcard.text = currentDeck[cardIndex]["term"]
        flashcardCounter.text = "\(cardIndex + 1) / \(currentDeck.count)"
        
        

    }
    
    func shuffleFlashcards(){
        for i in 0...currentDeck.count-1 {
            let swapCardIndex = Int(arc4random_uniform(UInt32(currentDeck.count)))
            let temp = currentDeck[i]
            currentDeck[i] = currentDeck[swapCardIndex]
            currentDeck[swapCardIndex] = temp
        }
        
    }
    
    func fetchFocusCards() {
        let userRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Flashcard")
        do {
            let results = try managedObjectContext.fetch(userRequest)
            focusCards = results as! [Flashcard]
        } catch {
            //print the error if it is caught(Swift automatically saves the error in "error")
            print("\(error)")
        }
        
    }


}
