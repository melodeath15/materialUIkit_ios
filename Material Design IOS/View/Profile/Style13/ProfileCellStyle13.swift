//
//  ProfileCellStyle13.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 11/9/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ProfileCellStyle13Delegate {
    func pushCell(tag: Int, index: IndexPath, data: NSArray)
    func plush()
    func share()
    func love()
}

class ProfileCellStyle13: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var delegate: ProfileCellStyle13Delegate?
    @IBOutlet var bgCell: UIView!
    @IBOutlet var title: UILabel!
    @IBOutlet var collectionImg: UICollectionView!
    @IBOutlet var btnPlush: UIButton!
    @IBOutlet var btnShare: UIButton!
    @IBOutlet var btnLove: UIButton!
    
    var data = NSArray()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnPlush.layer.borderColor = UIColor.groupTableViewBackground .cgColor
        btnPlush.layer.borderWidth = 2
        btnPlush.layer.cornerRadius = btnPlush.frame.size.width/2
        btnPlush.clipsToBounds = true
        
        btnShare.layer.borderColor = UIColor.groupTableViewBackground .cgColor
        btnShare.layer.borderWidth = 2
        btnShare.layer.cornerRadius = btnShare.frame.size.width/2
        btnShare.clipsToBounds = true
        
        btnLove.layer.borderColor = UIColor.groupTableViewBackground .cgColor
        btnLove.layer.borderWidth = 2
        btnLove.layer.cornerRadius = btnLove.frame.size.width/2
        btnLove.clipsToBounds = true
        
        collectionImg.delegate = self
        collectionImg.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileImgCellStyle13", for: indexPath) as! ProfileImgCellStyle13
        
        cell.img.downloadedFrom(link: "\(data[indexPath.row])", contentMode: .scaleAspectFill)

        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.pushCell(tag: collectionView.tag, index: indexPath, data: data)
    }
    
    @IBAction func pushBtnPlush(_ sender: Any) {
        delegate?.plush()
    }
    
    @IBAction func pushBtnShare(_ sender: Any) {
        delegate?.share()
    }
    
    @IBAction func pushBtnLove(_ sender: Any) {
        delegate?.love()
    }
    
}
