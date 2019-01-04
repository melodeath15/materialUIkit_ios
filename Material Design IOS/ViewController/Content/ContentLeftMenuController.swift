//
//  ContentLeftMenuController.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/18/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

class ContentLeftMenuController: UIViewController, EcommerceLeftMenuDelegate {
    
    var back = EcommerceLeftMenu() // var gallery for left menu
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        back = Bundle.main.loadNibNamed("EcommerceLeftMenu", owner: nil, options: nil)?.first as! EcommerceLeftMenu
        back.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.2, height: 80)
        back.backgroundColor = UIColor.init(red: 204/255, green: 16/255, blue: 0/255, alpha: 1)
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
