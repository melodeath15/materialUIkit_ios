//
//  MenuStyle1ViewMenu.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/12/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol MenuStyle1ViewMenuDelegate {
    func photo()
    func video()
    func message()
    func setting()
    func friends()
    func notif()
}

class MenuStyle1ViewMenu: UIView {
    
    var delegate: MenuStyle1ViewMenuDelegate?
    
    @IBOutlet var btnPhoto: UIButton!
    @IBOutlet var titlePhoto: UILabel!
    @IBOutlet var btnVideo: UIButton!
    @IBOutlet var titleVideo: UILabel!
    @IBOutlet var btnMessage: UIButton!
    @IBOutlet var titleMessage: UILabel!
    @IBOutlet var btnSetting: UIButton!
    @IBOutlet var titleSetting: UILabel!
    @IBOutlet var btnFriends: UIButton!
    @IBOutlet var titleFriends: UILabel!
    @IBOutlet var btnNotif: UIButton!
    @IBOutlet var titleNotif: UILabel!
    
    @IBAction func pushPhoto(_ sender: Any) {
        delegate?.photo()
    }
    
    @IBAction func pushVideo(_ sender: Any) {
        delegate?.video()
    }
    
    @IBAction func pushMessage(_ sender: Any) {
        delegate?.message()
    }
    
    @IBAction func pushSetting(_ sender: Any) {
        delegate?.setting()
    }
    
    @IBAction func pushFriends(_ sender: Any) {
        delegate?.friends()
    }
    
    @IBAction func pushNotif(_ sender: Any) {
        delegate?.notif()
    }

}
