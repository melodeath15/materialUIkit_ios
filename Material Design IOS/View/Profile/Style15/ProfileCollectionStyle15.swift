//
//  ProfileCollectionStyle15.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/10/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileCollectionStyle15Delegate {
    func activeMenu(index: IndexPath)
}

class ProfileCollectionStyle15: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var delegate: ProfileCollectionStyle15Delegate?
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCellStyle15", for: indexPath) as! ProfileCellStyle15
        
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
