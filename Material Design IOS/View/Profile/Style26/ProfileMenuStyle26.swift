//
//  ProfileMenuStyle26.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/14/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileMenuStyle26Delegate {
    func pushMenu(index: IndexPath)
}

class ProfileMenuStyle26: UIView, UICollectionViewDelegate, UICollectionViewDataSource, ProfileMenuCellStyle26Delegate {

    var delegate: ProfileMenuStyle26Delegate?
    @IBOutlet var collection: UICollectionView!
    var name = NSArray()
    var img = NSArray()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collection.delegate = self
        collection.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileMenuCellStyle26", for: indexPath) as! ProfileMenuCellStyle26
        
        cell.name.text = "\(name[indexPath.row])"
        cell.btnMenu.setImage(UIImage(named:"\(img[indexPath.row])"), for: .normal)
        
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
    
    func pushBtn(index: IndexPath) {
        delegate?.pushMenu(index: index)
    }
    
    
}
