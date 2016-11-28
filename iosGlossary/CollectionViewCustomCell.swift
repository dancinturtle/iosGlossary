//
//  CollectionViewCustomCell.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/18/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//

import UIKit

class CollectionViewCustomCell: UICollectionViewCell {
    var delegate: FlashCardDelegate?
    var focusStack: Bool?
    var side = "front"
    var counter: Int?
    var totalDeck: Int?
    @IBOutlet weak var flashcardLabel: UILabel!
    
    
    @IBOutlet weak var linkToDocsButton: UIButton!
    
    @IBOutlet weak var updateLabel: UILabel!
    
    @IBAction func focusButtonPressed(_ sender: UIButton) {
        print("Put it in the focus pile")
        delegate?.addToFocusDeck(sender: self)
    }
    
    
    @IBOutlet weak var focusButton: UIButton!
    
    @IBAction func visitDocsButtonPressed(_ sender: UIButton) {
        delegate?.visitDocs(sender: self)
        
    }
    
    
    @IBOutlet weak var platformLabel: UILabel!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    
    @IBAction func gotItButtonPressed(_ sender: UIButton) {
        print("Got it in the custom cell")
        delegate?.removeFromFocusDeck(sender: self)
    }
    
    @IBOutlet weak var gotItButton: UIButton!
    
    
    @IBOutlet weak var flipButton: UIButton!
    
    @IBAction func flipButtonPressed(_ sender: UIButton) {
        if side == "front"{
            side = "back"
        }
        else {
            side = "front"
        }
        updateLabel.isHidden = true
        delegate?.flipFlashcard(sender: self)
        
    }
    
    func displayCell(){
        
        let allButtons = [flipButton, gotItButton, focusButton]
        if let count = counter, let total = totalDeck {
           
            if count > 0 {
                flipButton.isEnabled = true
                counterLabel.text = String(describing: count) + "/" + String(describing: total)
            }
            else {
            
                for button in allButtons {
                    button?.isEnabled = false
                    button?.isHidden = true
                }
                counterLabel.isHidden = true
            }
        }
        if focusStack == true {
            focusButton.isEnabled = false
            focusButton.isHidden = true
        }
        else {
            gotItButton.isEnabled = false
            gotItButton.isHidden = true
        }
        
       if side == "front" {
        platformLabel.isHidden = true
        linkToDocsButton.isHidden = true
        }
       else {
        platformLabel.isHidden = false
        linkToDocsButton.isHidden = false
        }
    }
    
}


