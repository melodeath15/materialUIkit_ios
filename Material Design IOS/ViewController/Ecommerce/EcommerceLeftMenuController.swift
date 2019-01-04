//
//  EcommerceLeftMenuController.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/2/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceLeftMenuController: UIViewController, EcommerceLeftMenuDelegate {
    
    var back = EcommerceLeftMenu() // var gallery for left menu
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        back = Bundle.main.loadNibNamed("EcommerceLeftMenu", owner: nil, options: nil)?.first as! EcommerceLeftMenu
        back.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.2, height: 80)
        back.delegate = self
        self.view.addSubview(back)
    }
    
    func backVC() { // function for back
        navigationController?.popViewController(animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent // return for status bar lightcontent
    }
}
