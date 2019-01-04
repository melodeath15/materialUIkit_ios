//
//  ProfileHeaderStyle30.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/15/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileHeaderStyle30Delegate {
    func plush()
    func share()
    func activeMenu(index: IndexPath)
}

class ProfileHeaderStyle30: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, ProfileCellMenuStyle30Delegate {
    
    var delegate: ProfileHeaderStyle30Delegate?
    @IBOutlet var profile: UIImageView!
    @IBOutlet var btnPlush: UIButton!
    @IBOutlet var btnShare: UIButton!
    @IBOutlet var name: UILabel!
    @IBOutlet var city: UILabel!
    @IBOutlet var collection: UICollectionView!
    
    var img = NSArray()
    var title = NSArray()
    var counter = NSArray()
    var active = Int()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profile.layer.cornerRadius = profile.frame.size.width/2
        profile.clipsToBounds = true
        
        btnPlush.layer.cornerRadius = btnPlush.frame.size.width/2
        btnPlush.clipsToBounds = true
        
        btnShare.layer.borderColor = UIColor.groupTableViewBackground .cgColor
        btnShare.layer.borderWidth = 2
        btnShare.layer.cornerRadius = btnPlush.frame.size.width/2
        btnShare.clipsToBounds = true
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width/4, height: 95)
        collection.setCollectionViewLayout(layout, animated: true)
        
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "ProfileCellMenuStyle30", bundle:nil), forCellWithReuseIdentifier: "ProfileCellMenuStyle30")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return counter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCellMenuStyle30", for: indexPath) as! ProfileCellMenuStyle30
        
        cell.btnCell.setImage(UIImage(named:"\(img[indexPath.row])"), for: .normal)
        cell.value.text = "\(counter[indexPath.row])"
        cell.label.text = "\(title[indexPath.row])"
        
        if indexPath.row == active{
            cell.view.isHidden = false
        }else{
            cell.view.isHidden = true
        }
        
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        active = indexPath.row
        collection.reloadData()
        delegate?.activeMenu(index: indexPath)
    }
    
    func push(index: IndexPath) {
        active = index.row
        collection.reloadData()
        delegate?.activeMenu(index: index)
    }
    
    @IBAction func pushBtnPlush(_ sender: Any) {
        delegate?.plush()
    }
    
    @IBAction func pushBtnShare(_ sender: Any) {
        delegate?.share()
    }
    
}
