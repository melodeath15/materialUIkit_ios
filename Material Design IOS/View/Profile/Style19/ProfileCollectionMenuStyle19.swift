//
//  ProfileCollectionMenuStyle19.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/13/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileCollectionMenuStyle19Delegate {
    func activeMenu(index: IndexPath)
}

class ProfileCollectionMenuStyle19: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var delegate: ProfileCollectionMenuStyle19Delegate?
    @IBOutlet var collection: UICollectionView!
    var data = NSArray()
    var active = Int()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collection.delegate = self
        collection.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCellStyle19", for: indexPath) as! ProfileCellStyle19
        
        cell.img.image = UIImage(named: "\(data[indexPath.row])")
        
        if indexPath.row == active{
            cell.view.isHidden = false
        }else{
            cell.view.isHidden = true
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        active = indexPath.row
        collection.reloadData()
        delegate?.activeMenu(index: indexPath)
    }
    
}
