//
//  ViewActivitySyle11Button.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/9/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol ViewActivitySyle11ButtonDelegate {
    func pushFloating()
}

class ViewActivitySyle11Button: UIView {
    
    var delegate: ViewActivitySyle11ButtonDelegate?
    @IBOutlet var btnFloating: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnFloating.layer.cornerRadius = btnFloating.frame.size.width/2
        btnFloating.clipsToBounds = true
        
    }
    
    @IBAction func btnPush(_ sender: Any) {
        delegate?.pushFloating()
    }

}
