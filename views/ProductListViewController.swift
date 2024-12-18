//
//  ProductListViewController.swift
//  cttest
//
//  Created by Kosmas Ndruru on 14/03/24.
//

import Foundation
import UIKit
import SwiftUI

class ProductListViewController: UICollectionViewController{
    
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>

    var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration {
            (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
            let product = Product.sampleData[indexPath.item]
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = product.title
            contentConfiguration.secondaryText = product.notes
            contentConfiguration.image = self.resizeImage(image: UIImage(imageLiteralResourceName: "cakex.jpeg"), newWidth: 100).withRoundedCorners(radius: 20)
            cell.contentConfiguration = contentConfiguration
        }
        
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        //        var snapshot = Snapshot()
        //        snapshot.appendSections([0])
        //        var reminderTitles = [String]()
        //        for reminder in Product.sampleData {
        //            reminderTitles.append(reminder.title)
        //        }
        //        snapshot.appendItems(reminderTitles)
        
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        var title = [String]()
        for product in Product.sampleData{
            title.append(product.title)
        }
        //snapshot.appendItems(Product.sampleData.map { $0.title })
        snapshot.appendItems(title)
        dataSource.apply(snapshot)
        
        collectionView.dataSource = dataSource
    }
    
    private func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {

        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        image.draw(in: CGRectMake(0, 0, newWidth, newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }

    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = true
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}

extension UIImage {
    // image with rounded corners
    public func withRoundedCorners(radius: CGFloat? = nil) -> UIImage? {
        let maxRadius = min(size.width, size.height) / 2
        let cornerRadius: CGFloat
        if let radius = radius, radius > 0 && radius <= maxRadius {
            cornerRadius = radius
        } else {
            cornerRadius = maxRadius
        }
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let rect = CGRect(origin: .zero, size: size)
        UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
        draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
