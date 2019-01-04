//
//  GalleryStyle12Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol GalleryStyle12HeaderDelegate {
    func menu()
    func share()
    func edit()
    func close()
    func option()
}

class GalleryStyle12Header: UIView {
    
    var delegate: GalleryStyle12HeaderDelegate?
    @IBOutlet var btnMenu: UIButton!
    @IBOutlet var btnShare: UIButton!
    @IBOutlet var btnEdit: UIButton!
    @IBOutlet var btnClose: UIButton!
    @IBOutlet var btnOption: UIButton!
    
    @IBAction func pushBtnMenu(_ sender: Any) {
        delegate?.menu()
    }
    
    @IBAction func pushBtnShare(_ sender: Any) {
        delegate?.share()
    }
    
    @IBAction func pushBtnEdit(_ sender: Any) {
        delegate?.edit()
    }
    
    @IBAction func pushBtnClose(_ sender: Any) {
        delegate?.close()
    }

    @IBAction func pushBtnOption(_ sender: Any) {
        delegate?.option()
    }
    
}
