//
//  EcommerceStyle18Collection.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/8/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle18CollectionDelegate {
    func didSelect(index: Int)
}

class EcommerceStyle18Collection: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var delegate: EcommerceStyle18CollectionDelegate?
    @IBOutlet var title: UILabel!
    @IBOutlet var collection: UICollectionView!
    
    var listImg = NSArray()
    var listName = NSArray()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collection.delegate = self
        collection.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EcommerceStyle1Cell", for: indexPath) as! EcommerceStyle1Cell
        
        cell.img.image = UIImage(named: "\(listImg[indexPath.row])")
        cell.title.text = "\(listName[indexPath.row])"
        cell.price.text = "$225"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect(index: indexPath.row)
    }
    
}
