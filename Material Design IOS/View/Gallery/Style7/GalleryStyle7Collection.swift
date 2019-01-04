//
//  GalleryStyle7Collection.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/27/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle7CollectionDelegate {
    func pushCellSelect(tag: Int, count: Int, data: NSArray)
    func pushCell(tag: Int, index: Int, data: NSArray)

}

class GalleryStyle7Collection: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, GalleryStyle7CellDelegate {
    
    var delegate: GalleryStyle7CollectionDelegate?
    @IBOutlet var title: UILabel!
    @IBOutlet var collectionImg: UICollectionView!
    
    var index = NSMutableArray()
    var data = NSArray()
    var selectImg = Int()
    var pageGallery = Int()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionImg.delegate = self
        collectionImg.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryStyle7Cell", for: indexPath) as! GalleryStyle7Cell
        
        if pageGallery == 8{
            cell.video.isHidden = false
            cell.btnCell.isEnabled = false
        }else{
            cell.video.isHidden = true
            cell.btnCell.isEnabled = true
        }
        
        cell.img.downloadedFrom(link: "\(data[indexPath.row])", contentMode: .scaleAspectFill)
        
        index.add(indexPath.row)
        cell.delegate = self
        return cell
    }
    
    func pushcellSelect(count: Int) {
        delegate?.pushCellSelect(tag: collectionImg.tag, count: count, data: data)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.pushCell(tag: collectionView.tag, index: index[indexPath.row] as! Int, data: data)
    }

    
}
