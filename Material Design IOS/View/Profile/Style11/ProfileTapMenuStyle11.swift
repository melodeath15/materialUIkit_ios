//
//  ProfileTapMenuStyle11.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileTapMenuStyle11Delegate {
    func activeMenu(index: IndexPath)
}

class ProfileTapMenuStyle11: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var delegate: ProfileTapMenuStyle11Delegate?
    @IBOutlet var collection: UICollectionView!
    var counterMenu = Int()
    var active = Int()
    var data = NSArray()
    var title = NSArray()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width/5, height: 60)
        collection.setCollectionViewLayout(layout, animated: true)
        
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "ProfileTapCell", bundle:nil), forCellWithReuseIdentifier: "ProfileTapCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return counterMenu
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileTapCell", for: indexPath) as! ProfileTapCell
        
        cell.value.text = "\(data[indexPath.row])"
        cell.title.text = "\(title[indexPath.row])"
        
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
