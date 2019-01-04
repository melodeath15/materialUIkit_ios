//
//  GalleryStyle2CellBig.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/20/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle2CellBigDelegate {
    func pushCell(tag: Int, index: Int, data: NSArray)
}

class GalleryStyle2CellBig: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var delegate: GalleryStyle2CellBigDelegate?
    @IBOutlet var title: UILabel!
    @IBOutlet var count: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    var index = NSMutableArray()
    var collection: UICollectionView!
    var data = NSArray()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryStyle2Cell", for: indexPath) as! GalleryStyle2Cell
        
        cell.img.downloadedFrom(link: "\(data[indexPath.row])", contentMode: .scaleAspectFill)
        
        index.add(indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.pushCell(tag: collectionView.tag, index: index[indexPath.row] as! Int, data: data)
    }
    
    
}
