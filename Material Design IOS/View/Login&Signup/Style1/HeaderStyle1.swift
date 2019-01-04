//
//  HeaderStyle1.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/23/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol HeaderStyle1Delegate {
    func back1() 
    func search1()
    func MenuOption()
}

class HeaderStyle1: UIView {
    
    var delegate: HeaderStyle1Delegate?
    @IBOutlet var iconBack: UIButton!
    @IBOutlet var titleHeader: UILabel!
    @IBOutlet var btnSearch: UIButton!
    @IBOutlet var btnOption: UIButton!
        
    @IBAction func back(_ sender: Any) {
        delegate?.back1()
    }
    
    @IBAction func search(_ sender: Any) {
        delegate?.search1()
    }
    
    @IBAction func option(_ sender: Any) {
        delegate?.MenuOption()
    }
}
