//
//  StudyCollectionViewController.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/18/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//

import UIKit

class StudyCollectionViewController: UICollectionViewController {
    
   
    var indexPathsForVisibleItems: [IndexPath]?
    let lettersarray = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return lettersarray.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "flashcardCell", for: indexPath as IndexPath) as! CollectionViewCustomCell
        cell.backgroundColor = UIColor.red
        cell.flashcardLabel.text = lettersarray[indexPath.item]
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: view.bounds.width, height: view.bounds.height/1.1)
        
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator){
        super.viewWillTransition(to: size, with: coordinator)
        indexPathsForVisibleItems = collectionView?.indexPathsForVisibleItems
        print("Index Paths", indexPathsForVisibleItems)
        updateCollectionViewLayout(with: size)
        
    }

    private func updateCollectionViewLayout(with size: CGSize){
        
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = (size.width < size.height) ? CGSize(width: view.bounds.width, height: view.bounds.height/1.1) : CGSize(width: view.bounds.width, height: view.bounds.height/1.1)
//            
//            if let scrollTo = indexPathsForVisibleItems {
//                print("Scrollin to", scrollTo[0])
//                collectionView?.scrollToItem(at: scrollTo[0], at: UICollectionViewScrollPosition.centeredHorizontally, animated: false)
//                
//            }
            
            layout.invalidateLayout()
        }
        
        
        
    }
    
//    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
//        
//    }

}
