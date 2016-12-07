//
//  StudyCollectionViewController.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/18/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//

import UIKit
import CoreData


class StudyCollectionViewController: UICollectionViewController, FlashCardDelegate {
    
   
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var indexPathsForVisibleItems: [IndexPath]?
    var section : String?
    var allTerms: [GlossyFlashcard]?
    var allSectionTerms = [GlossyFlashcard]()
    var navBarTitle: String?
    var indexPathOnRotation: NSIndexPath?
    var focusCards = [Flashcard]()
    var currentDeck = [GlossyFlashcard]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let currSection = section {
            if let allFlashcards = allTerms {
                for flashcard in allFlashcards {
                    if flashcard.section == currSection {
                        allSectionTerms.append(flashcard)
                    }
                }
                print("Finished making all section terms")
            }
        }
        fetchFocusCards()
        if let navTitle = navBarTitle {
            self.title = navTitle
            if navTitle == "Full stack"{
                currentDeck = allSectionTerms
                
            }
            else {
                for card in focusCards{
                    for term in allSectionTerms {
                        if card.term == term.term {
                            currentDeck.append(term)
                            break
                        }
                    }
                }
            }
        }
        
        shuffleFlashcards()
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if currentDeck.count > 0 {
            return currentDeck.count
        }
        else {
            return 1
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "flashcardCell", for: indexPath as IndexPath) as! CollectionViewCustomCell
        cell.delegate = self
        if self.title == "Full stack"{
            cell.focusStack = false;
        }
        else {
            cell.focusStack = true;
        }
        cell.updateLabel.isHidden = true
        
        if currentDeck.count > 0 {
            if cell.side == "front" {
                cell.flashcardLabel.text = currentDeck[indexPath.item].term
            }
            else {
                cell.flashcardLabel.text = currentDeck[indexPath.item].def
            }
            cell.platformLabel.text = currentDeck[indexPath.item].plat
            cell.counter = indexPath.item + 1
            cell.totalDeck = currentDeck.count
        }
        
        else {
            cell.counter = 0
            cell.totalDeck = 0
            cell.flashcardLabel.text = "No cards in deck"
        }
        cell.displayCell()  
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        return CGSize(width: view.bounds.width, height: view.bounds.height/1.1)
        
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator){
        super.viewWillTransition(to: size, with: coordinator)
        let offset = collectionView?.contentOffset
        let width = collectionView?.bounds.size.width
        let index = round(offset!.x / width!)
        let newOffset = CGPoint(x: index * size.width, y: offset!.y)
        collectionView?.setContentOffset(newOffset, animated: false)
        coordinator.animate(alongsideTransition: {(context) in self.collectionView?.reloadData(); self.collectionView?.setContentOffset(newOffset, animated: false)}, completion: nil)
    }

    


    private func updateCollectionViewLayout(with size: CGSize){
        
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = (size.width < size.height) ? CGSize(width: view.bounds.width, height: view.bounds.height/1.1) : CGSize(width: view.bounds.width, height: view.bounds.height/1.1)
            
            layout.invalidateLayout()
        }
        
        
        
    }
    
    func flipFlashcard(sender: CollectionViewCustomCell){
        let indexpath = collectionView?.indexPath(for: sender)?.row
        if sender.side == "front"{
            sender.flashcardLabel.text = currentDeck[indexpath!].term
        }
        else {
            sender.flashcardLabel.text = currentDeck[indexpath!].def
        }

        sender.displayCell()
    }
    
    func visitDocs(sender: CollectionViewCustomCell){
        let indexpath = collectionView?.indexPath(for: sender)?.row
        
        let stringurl = String(describing: currentDeck[indexpath!].doc)
        let url = URL(string: stringurl)
        if UIApplication.shared.canOpenURL(url!){
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            UIApplication.shared.open(url!, options: [:], completionHandler: {
                (success) in
                print("Open url: \(success)")})
        }
    }
    
    func fetchFocusCards() {
        let userRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Flashcard")
        do {
            let results = try managedObjectContext.fetch(userRequest)
            focusCards = results as! [Flashcard]
        } catch {
            print("\(error)")
        }
        
    }
    
    
    func addToFocusDeck(sender: CollectionViewCustomCell){
        
        var found = false
        let indexpath = collectionView?.indexPath(for: sender)?.row
        let focusCard = currentDeck[indexpath!]
        sender.updateLabel.isHidden = false
        
        for card in focusCards {
            if card.term == focusCard.term {
                sender.updateLabel.text = "In focus"
                found = true
                break
            }
        }
        if found == false {
            sender.updateLabel.text = "Added to focus"
            let card = NSEntityDescription.insertNewObject(forEntityName: "Flashcard", into: managedObjectContext) as! Flashcard
            card.term = focusCard.term
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
            
        }
    }
    
    func removeFromFocusDeck(sender: CollectionViewCustomCell){
        
        let indexpath = collectionView?.indexPath(for: sender)?.row
        let cardToDelete = currentDeck[indexpath!]
        for card in focusCards {
            if card.term == cardToDelete.term {
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
        currentDeck.remove(at: indexpath!)
        collectionView?.reloadData()
    }
    
    func shuffleFlashcards(){
        if currentDeck.count < 2 {
            print("Nothing to shuffle")
        }
        else {
            for i in 0...currentDeck.count-1 {
                let swapCardIndex = Int(arc4random_uniform(UInt32(currentDeck.count)))
                let temp = currentDeck[i]
                currentDeck[i] = currentDeck[swapCardIndex]
                currentDeck[swapCardIndex] = temp
            }
        }
        
    }
}
