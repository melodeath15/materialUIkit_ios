//
//  GalleryLeftMenuController.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/19/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryLeftMenuController: UIViewController, GalleryLeftMenuDelegate {
    
    var back = GalleryLeftMenu() // var gallery for left menu
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        back = Bundle.main.loadNibNamed("GalleryLeftMenu", owner: nil, options: nil)?.first as! GalleryLeftMenu
        back.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.2, height: 80)
        back.delegate = self
        self.view.addSubview(back)
        
    }
    
    func backVC() { // function for back
        navigationController?.popViewController(animated: true)
        
        // remove for notification selected
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "selected"), object: nil);

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent // return for status bar lightcontent
    }
}
