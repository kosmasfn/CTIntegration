//
//  FlowLayout.swift
//  cttest
//
//  Created by Kosmas Ndruru on 14/03/24.
//

import Foundation
import UIKit

class FlowLayout: UICollectionViewFlowLayout{
    
    let itemSpacing: CGFloat = 10.0
    
    override init() {
        super.init()
        self.minimumLineSpacing = itemSpacing
        self.minimumInteritemSpacing = itemSpacing
        self.sectionInset = UIEdgeInsets(top: itemSpacing, left: itemSpacing, bottom: itemSpacing, right: itemSpacing)
        self.itemSize = CGSize(width: 100.0, height: 100.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
