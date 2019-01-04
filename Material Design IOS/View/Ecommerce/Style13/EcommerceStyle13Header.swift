//
//  EcommerceStyle13Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle13HeaderDelegate {
    func didSelectImg(index: NSIndexPath, data: NSArray)
    func showImg(index: Int, data: NSArray)
}

class EcommerceStyle13Header: UITableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var delegate: EcommerceStyle13HeaderDelegate?
    @IBOutlet var collection: UICollectionView!
    var data = NSArray()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collection.delegate = self
        collection.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EcommerceStyle13Img", for: indexPath) as! EcommerceStyle13Img
        cell.img.image = UIImage(named: "\(data[indexPath.row])")
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
