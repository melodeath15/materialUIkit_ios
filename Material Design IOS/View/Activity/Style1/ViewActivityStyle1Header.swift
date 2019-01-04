//
//  ViewActivityStyle1Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewActivityStyle1HeaderDelegate {
    func MenuOrBack()
    func Write()
    func Search()
    func Option()
}

class ViewActivityStyle1Header: UIView {
    
    var delegate: ViewActivityStyle1HeaderDelegate?
    @IBOutlet var iconBack: UIButton!
    @IBOutlet var titleHeader: UILabel!
    @IBOutlet var btnSearch: UIButton!
    @IBOutlet var btnOption: UIButton!
    @IBOutlet var btnWrite: UIButton!
    
    @IBAction func back(_ sender: Any) {
        delegate?.MenuOrBack()
    }
    
    @IBAction func search(_ sender: Any) {
        delegate?.Search()
    }
    
    @IBAction func writer(_ sender: Any) {
        delegate?.Write()
    }
    
    @IBAction func option(_ sender: Any) {
        delegate?.Option()
    }
}
