//
//  GalleryStyle25Collectionview.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle25CollectionviewDelegate {
    func pushBtnShare(index: NSIndexPath)
}

class GalleryStyle25Collectionview: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, GalleryStyle25HeaderDelegate, GalleryStyle23CellDelegate {
    
    @IBOutlet var collectionMenu: UICollectionView!
    var delegate: GalleryStyle25CollectionviewDelegate?
    var dataImg = NSArray()
    var dataName = NSArray()
    var tagName = NSArray()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionMenu.delegate = self
        collectionMenu.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryStyle25Header", for: indexPath) as! GalleryStyle25Header
            cell.img.image = UIImage(named: "\(dataImg[indexPath.row])")
            cell.title.text = "\(dataName[indexPath.row])"
            cell.count.text = "\(dataImg.count-1) Photos"
            cell.index = indexPath as NSIndexPath
            cell.delegate = self
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryStyle23Cell", for: indexPath) as! GalleryStyle23Cell
            cell.img.image = UIImage(named: "\(dataImg[indexPath.row])")
            cell.title.text = "\(dataName[indexPath.row])"
            cell.tagLabel.text = "\(tagName[indexPath.row-1])"
            cell.btnShare.isHidden = false
            cell.index = indexPath as NSIndexPath
            cell.delegate = self
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var cellSize = UIScreen.main.bounds.size
        
        if indexPath.row == 0 {
            cellSize.width = UIScreen.main.bounds.size.width
            cellSize.height = UIScreen.main.bounds.size.height/2
            return cellSize
        }else{
            cellSize.width = UIScreen.main.bounds.size.width/2
            cellSize.height = UIScreen.main.bounds.size.height/2
            return cellSize
        }

    }
    
    func shareImg(index: NSIndexPath) {
        delegate?.pushBtnShare(index: index)
    }
    
    func share(index: NSIndexPath) {
        delegate?.pushBtnShare(index: index)
    }
    
}
