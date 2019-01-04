//
//  GallerySyle6Collection.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/21/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GallerySyle6CollectionDelegate {
    func pushCellSelect(tag: Int, count: Int, data: NSArray)
    func showAll(tag: Int)
}

class GallerySyle6Collection: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, GalleryStyle6CellDelegate {

    var delegate: GallerySyle6CollectionDelegate?
    @IBOutlet var bgCell: UIView!
    @IBOutlet var title: UILabel!
    @IBOutlet var countImg: UILabel!
    @IBOutlet var collImg: UICollectionView!
    
    var index = NSMutableArray()
    var data = NSArray()
    var selectImg = Int()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collImg.delegate = self
        collImg.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if data.count > 6{
            return 6
        }else{
            return data.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryStyle6Cell", for: indexPath) as! GalleryStyle6Cell
        
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
        cell.index = indexPath as NSIndexPath
        index.add(indexPath.row)
        cell.delegate = self
        return cell
    }
    
    func pushCell(count: Int) {
        delegate?.pushCellSelect(tag: collImg.tag, count: count, data: data)
    }
    
    func pushShowAll() {
        delegate?.showAll(tag: collImg.tag)
    }
    
}
