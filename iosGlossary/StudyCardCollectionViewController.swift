//
//  StudyCardCollectionViewController.swift
//  iosGlossary
//
//  Created by Amy Giver on 11/18/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//

import UIKit

class StudyCardCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var flashcardCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        flashcardCollectionView.delegate = self
        flashcardCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 200
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "flashCell", for: indexPath as IndexPath)
        cell.backgroundColor = UIColor.red
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    
        return CGSize(width: view.bounds.width/1.0, height: view.bounds.height/2.0)
        
    }
    
    
}
