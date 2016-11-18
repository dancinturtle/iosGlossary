//
//  CollectionViewCustomCell.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/18/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//

import UIKit

class CollectionViewCustomCell: UICollectionViewCell {
    
    
    @IBAction func gotItButtonPressed(_ sender: UIButton) {
        print("Got it in the custom cell")
    }
    
    @IBAction func flipButtonPressed(_ sender: UIButton) {
        print("Flipping!")
    }

}


