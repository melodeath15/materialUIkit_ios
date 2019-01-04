//
//  MenuStyle17.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/17/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol MenuStyle17Delegate {
    func dashboard()
    func explore()
    func image()
    func video()
    func friend()
    func message()
    func profile()
    func setting()
}

class MenuStyle17: UIView {
    
    var delegate: MenuStyle17Delegate?
    
    @IBOutlet var btnDashboard: UIButton!
    @IBOutlet var btnExplore: UIButton!
    @IBOutlet var btnImage: UIButton!
    @IBOutlet var btnVideo: UIButton!
    @IBOutlet var btnFriend: UIButton!
    @IBOutlet var btnMessage: UIButton!
    @IBOutlet var btnProfile: UIButton!
    @IBOutlet var btnSetting: UIButton!
    
    @IBOutlet var titleDashboard: UILabel!
    @IBOutlet var titleExplore: UILabel!
    @IBOutlet var titlePhoto: UILabel!
    @IBOutlet var titleVideo: UILabel!
    @IBOutlet var titleFriends: UILabel!
    @IBOutlet var titleMessage: UILabel!
    @IBOutlet var titleProfile: UILabel!
    @IBOutlet var titleSetting: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnDashboard.layer.cornerRadius = btnDashboard.frame.size.width/2
        btnDashboard.clipsToBounds = true
        
        btnExplore.layer.cornerRadius = btnExplore.frame.size.width/2
        btnExplore.clipsToBounds = true
        
        btnImage.layer.cornerRadius = btnImage.frame.size.width/2
        btnImage.clipsToBounds = true
        
        btnVideo.layer.cornerRadius = btnVideo.frame.size.width/2
        btnVideo.clipsToBounds = true
        
        btnFriend.layer.cornerRadius = btnFriend.frame.size.width/2
        btnFriend.clipsToBounds = true
        
        btnMessage.layer.cornerRadius = btnMessage.frame.size.width/2
        btnMessage.clipsToBounds = true
        
        btnProfile.layer.cornerRadius = btnProfile.frame.size.width/2
        btnProfile.clipsToBounds = true
        
        btnSetting.layer.cornerRadius = btnSetting.frame.size.width/2
        btnSetting.clipsToBounds = true
    
    }
    
    @IBAction func pushBtnDashboard(_ sender: Any) {
        delegate?.dashboard()
    }
    
    @IBAction func pushBtnExplore(_ sender: Any) {
        delegate?.explore()
    }
    
    @IBAction func pushBtnImage(_ sender: Any) {
        delegate?.image()
    }
    
    @IBAction func pushBtnVideo(_ sender: Any) {
        delegate?.video()
    }
    
    @IBAction func pushBtnFriend(_ sender: Any) {
        delegate?.friend()
    }
    
    @IBAction func pushBtnMessage(_ sender: Any) {
        delegate?.message()
    }
    
    @IBAction func pushBtnProfile(_ sender: Any) {
        delegate?.profile()
    }
    
    @IBAction func pushBtnSetting(_ sender: Any) {
        delegate?.setting()
    }

}
