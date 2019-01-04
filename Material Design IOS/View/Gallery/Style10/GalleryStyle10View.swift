//
//  GalleryStyle10View.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/28/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle10ViewDelegate {
    func didSelectImg(index: NSIndexPath, data: NSArray)
    func showImg(index: Int, data: NSArray)
}

class GalleryStyle10View: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var delegate: GalleryStyle10ViewDelegate?
    @IBOutlet var collImg: UICollectionView!
    @IBOutlet var title: UILabel!
    @IBOutlet var count: UILabel!
    @IBOutlet var titleImg: UILabel!
    @IBOutlet var pageImg: UILabel!
    var data = NSArray()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collImg.delegate = self
        collImg.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryStyle10Cell", for: indexPath) as! GalleryStyle10Cell
        cell.imgCell.downloadedFrom(link: "\(data[indexPath.row])", contentMode: .scaleAspectFill)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize: CGSize = collectionView.bounds.size
        
        cellSize.width -= collectionView.contentInset.left
        cellSize.width -= collectionView.contentInset.right
        cellSize.height = cellSize.height + 0
        
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectImg(index: indexPath as NSIndexPath, data: data)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let width: CGFloat = scrollView.frame.size.width
        let index = Int((targetContentOffset.pointee.x + 1 * width) / width)
        
        delegate?.showImg(index: index, data: data)
        
    }
    
}
