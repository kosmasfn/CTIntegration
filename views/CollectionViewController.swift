//
//  CollectionViewController.swift
//  cttest
//
//  Created by Kosmas Ndruru on 14/03/24.
//

import Foundation
import UIKit

class CollectionViewController: UICollectionViewController{
    let identifier = "CustomCollectionView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: identifier)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
           // Return the number of sections
           return 1
       }
       override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           // Return the number of items in the section
           return 10
       }
       override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           // Configure the cell
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
           cell.backgroundColor = UIColor.gray
           return cell
       }
}
