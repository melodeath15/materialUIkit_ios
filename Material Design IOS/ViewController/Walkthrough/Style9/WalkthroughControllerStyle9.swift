//
//  WalkthroughControllerStyle9.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/4/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class WalkthroughControllerStyle9: UIViewController {

    var viewer = WalkthroughStyle9View() // var view xib in folder Walkthrough, style9, name WalkthroughStyle9View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // call function for create WalkthroughStyle3View
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 231/255.0, green: 51/255.0, blue: 110/255.0, alpha: 1.0)
        
        // Create WalkthroughStyle3View
        viewer = Bundle.main.loadNibNamed("WalkthroughStyle9View", owner: nil, options: nil)?.first as! WalkthroughStyle9View
        viewer.frame = CGRect(x: 0, y: 70, width: self.view.frame.size.width, height: self.view.frame.size.height-160)
        viewer.title.text = "Overview"
        viewer.des.text = "Making Friends is easy as waving your hand back and forth"
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

