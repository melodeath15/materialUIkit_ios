//
//  ViewPopupStyle29.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/19/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewPopupStyle29Delegate {
    func pushPhoto()
    func pushVideo()
    func pushDocument()
    func pushLocation()
    func pushContact()
    func pushAudio()
}

class ViewPopupStyle29: UIView {
    
    var delegate: ViewPopupStyle29Delegate?
    @IBOutlet var btnPhoto: UIButton!
    @IBOutlet var btnVideo: UIButton!
    @IBOutlet var btnDocument: UIButton!
    @IBOutlet var btnLocation: UIButton!
    @IBOutlet var btnContact: UIButton!
    @IBOutlet var btnAudio: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnPhoto.layer.cornerRadius = btnPhoto.frame.size.width/2
        btnPhoto.clipsToBounds = true
        
        btnVideo.layer.cornerRadius = btnVideo.frame.size.width/2
        btnVideo.clipsToBounds = true
        
        btnDocument.layer.cornerRadius = btnDocument.frame.size.width/2
        btnDocument.clipsToBounds = true
        
        btnLocation.layer.cornerRadius = btnLocation.frame.size.width/2
        btnLocation.clipsToBounds = true
        
        btnContact.layer.cornerRadius = btnContact.frame.size.width/2
        btnContact.clipsToBounds = true
        
        btnAudio.layer.cornerRadius = btnAudio.frame.size.width/2
        btnAudio.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnPhoto(_ sender: Any) {
        delegate?.pushPhoto()
    }
    
    @IBAction func pushBtnVideo(_ sender: Any) {
        delegate?.pushVideo()
    }
    
    @IBAction func pushBtnDocument(_ sender: Any) {
        delegate?.pushDocument()
    }
    
    @IBAction func pushBtnLocation(_ sender: Any) {
        delegate?.pushLocation()
    }
    
    @IBAction func pushBtnContact(_ sender: Any) {
        delegate?.pushContact()
    }
    
    @IBAction func pushBtnAudio(_ sender: Any) {
        delegate?.pushAudio()
    }
}
