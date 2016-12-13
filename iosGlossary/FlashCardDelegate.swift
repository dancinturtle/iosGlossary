//
//  FlashCardDelegate.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/18/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//

import UIKit


protocol FlashCardDelegate: class {
    func flipFlashcard(sender: CollectionViewCustomCell)
    func visitDocs(sender: CollectionViewCustomCell)
    func addToFocusDeck(sender: CollectionViewCustomCell)
    func removeFromFocusDeck(sender: CollectionViewCustomCell)
}
