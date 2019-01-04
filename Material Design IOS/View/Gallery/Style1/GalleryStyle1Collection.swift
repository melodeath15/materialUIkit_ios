//
//  GalleryStyle1Collection.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/19/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle1CollectionDelegate {
    func pushCell(tag: Int, index: Int, data: NSArray)
}

class GalleryStyle1Collection: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    var delegate: GalleryStyle1CollectionDelegate?
    @IBOutlet var bgCell: UIView!
    @IBOutlet var title: UILabel!
    @IBOutlet var collectionImg: UICollectionView!
    
    var index = NSMutableArray()
    var data = NSArray()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionImg.delegate = self
        collectionImg.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if data.count > 6{
            return 6
        }else{
            return data.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryStyle1Cell", for: indexPath) as! GalleryStyle1Cell
        
        switch indexPath.row {
        case 5:
            cell.img.downloadedFrom(link: "\(data[indexPath.row])", contentMode: .scaleAspectFill)
            cell.value.isHidden = false
            cell.label.isHidden = false
            cell.img.alpha = 0.2
        default:
            cell.img.downloadedFrom(link: "\(data[indexPath.row])", contentMode: .scaleAspectFill)
            cell.value.isHidden = true
            cell.label.isHidden = true
        }
        
        let count = data.count - 5
        cell.value.text = "\(count)"
        cell.backgroundColor = UIColor.clear

        
        index.add(indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.pushCell(tag: collectionView.tag, index: index[indexPath.row] as! Int, data: data)
    }
    
}
