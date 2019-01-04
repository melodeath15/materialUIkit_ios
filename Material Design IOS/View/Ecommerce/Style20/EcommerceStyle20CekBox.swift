//
//  EcommerceStyle20CekBox.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/9/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle20CekBoxDelegate {
    func cekBox(index: Int, cekState: M13Checkbox, data: String)
}

class EcommerceStyle20CekBox: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, EcommerceStyle20CellCekBoxDelegate {
    
    var delegate: EcommerceStyle20CekBoxDelegate?
    @IBOutlet var title: UILabel!
    @IBOutlet var collection: UICollectionView!
    var dataCekbox = NSArray()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collection.delegate = self
        collection.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCekbox.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EcommerceStyle20CellCekBox", for: indexPath) as! EcommerceStyle20CellCekBox
        
        cell.title.text = "\(dataCekbox[indexPath.row])"
        
        cell.index = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func cekboxSelect(index: Int, checkState: M13Checkbox) {
        delegate?.cekBox(index: index, cekState: checkState, data: dataCekbox[index] as! String)
    }
    
}
