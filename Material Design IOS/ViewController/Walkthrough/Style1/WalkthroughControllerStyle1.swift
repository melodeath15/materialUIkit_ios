//
//  WalkthroughControllerStyle1.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/4/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class WalkthroughControllerStyle1: UIViewController {
    
    var viewer = WalkthroughStyle1View() // var view xib in folder Walkthrough, style1, name WalkthroughStyle1View

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // function for create WalkthroughStyle1View
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)

        // Create WalkthroughStyle1View
        viewer = Bundle.main.loadNibNamed("WalkthroughStyle1View", owner: nil, options: nil)?.first as! WalkthroughStyle1View
        viewer.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-180)
        viewer.title.text = "Overview"
        viewer.des.text = "Making Friends is easy as waving your hand back and forth"
        viewer.img.layer.cornerRadius = viewer.img.frame.size.width/2
        viewer.img.clipsToBounds = true
        self.view.addSubview(viewer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent // return for status bar lightcontent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
