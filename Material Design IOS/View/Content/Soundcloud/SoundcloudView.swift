//
//  SoundcloudView.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/24/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

protocol SoundcloudViewDelegate {
    func play()
    func stop()
    func backSong()
    func nextSong()
    func menuOption()
}

class SoundcloudView: UIView {
    
    var delegate: SoundcloudViewDelegate?
    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var deskripsi: UILabel!
    @IBOutlet var progres: UIProgressView!
    
    @IBOutlet var imgPlay: UIImageView!
    
    @IBAction func pushPlayorPause(_ sender: Any) {
        delegate?.play()
    }
    
    @IBAction func pushStop(_ sender: Any) {
        delegate?.stop()
    }
    
    @IBAction func pushBack(_ sender: Any) {
        delegate?.backSong()
    }
    
    @IBAction func pushNext(_ sender: Any) {
        delegate?.nextSong()
    }
    
    @IBAction func pushOption(_ sender: Any) {
        delegate?.menuOption()
    }
    
}
