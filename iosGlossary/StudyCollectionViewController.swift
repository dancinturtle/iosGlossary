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
    var allTerms: [GlossyFlashcard]?
    var navBarTitle: String?
    var indexPathOnRotation: NSIndexPath?
    var focusCards = [Flashcard]()
    var currentDeck = [GlossyFlashcard]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let navTitle = navBarTitle {
            self.title = navTitle
            if navTitle == "Full stack"{
                if let wholeDeck = allTerms {
                    currentDeck = wholeDeck
                }
            }
            else {
                fetchFocusCards()
                if let wholeDeck = allTerms {
                    for card in focusCards{
                        for term in wholeDeck {
                            if card.term == term.term {
                                currentDeck.append(term)
                                break
                            }
                        }
                    }
                }
            }
        }
        print("Current deck", currentDeck)
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
            cell.flashcardLabel.text = "No cards found"
        }
//            cell.linkToDocsButton.setTitle(wholeDeck[indexPath.item].doc, for: UIControlState.normal)
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
        if let wholeDeck = allTerms {
            if sender.side == "front"{
                sender.flashcardLabel.text = wholeDeck[indexpath!].term
            }
            else {
                sender.flashcardLabel.text = wholeDeck[indexpath!].def
            }
        }
        sender.displayCell()
    }
    
    func visitDocs(sender: CollectionViewCustomCell){
        print("delegate knows to visit docs")
        let indexpath = collectionView?.indexPath(for: sender)?.row
        if let wholeDeck = allTerms {
            let stringurl = String(describing: wholeDeck[indexpath!].doc)
            let url = URL(string: stringurl)
             if UIApplication.shared.canOpenURL(url!){
                 UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                UIApplication.shared.open(url!, options: [:], completionHandler: {
                    (success) in
                    print("Open url: \(success)")})


            }
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

}
