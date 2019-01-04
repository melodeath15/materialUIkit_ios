//
//  EcommerceStyle20CollectionColor.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/9/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle20CollectionColorDelegate {
    func selectedColor(index: Int, data: [UIColor])
}

class EcommerceStyle20CollectionColor: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, EcommerceStyle20CellDelegate {
    
    var delegate: EcommerceStyle20CollectionColorDelegate?
    @IBOutlet var title: UILabel!
    @IBOutlet var collection: UICollectionView!
    var dataColor = [UIColor]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collection.delegate = self
        collection.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataColor.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EcommerceStyle20Cell", for: indexPath) as! EcommerceStyle20Cell
        
        cell.viewColor.backgroundColor = dataColor[indexPath.row]
        
        cell.index = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func pushCellIndex(index: Int) {
        delegate?.selectedColor(index: index, data: [dataColor[index]])
    }
    
}
