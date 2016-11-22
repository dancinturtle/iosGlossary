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
    var side = "front"
    var counter: Int?
    var totalDeck: Int?
    @IBOutlet weak var flashcardLabel: UILabel!
    
    
    @IBOutlet weak var linkToDocsButton: UIButton!
    
    @IBOutlet weak var updateLabel: UILabel!
    
    @IBAction func focusButtonPressed(_ sender: UIButton) {
        print("Put it in the focus pile")
    }
    
    @IBAction func visitDocsButtonPressed(_ sender: UIButton) {
        delegate?.visitDocs(sender: self)
        
    }
    
    
    @IBOutlet weak var platformLabel: UILabel!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    
    @IBAction func gotItButtonPressed(_ sender: UIButton) {
        print("Got it in the custom cell")
    }
    
    @IBAction func flipButtonPressed(_ sender: UIButton) {
        if side == "front"{
            side = "back"
        }
        else {
            side = "front"
        }
        delegate?.flipFlashcard(sender: self)
        
    }
    
    func displayCell(){
        if let count = counter, let total = totalDeck {
            counterLabel.text = String(describing: count) + "/" + String(describing: total)
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


