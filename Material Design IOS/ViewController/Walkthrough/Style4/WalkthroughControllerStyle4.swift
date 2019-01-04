//
//  WalkthroughControllerStyle4.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/4/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class WalkthroughControllerStyle4: UIViewController {
    
    var viewer = WalkthroughStyle4View() // var view xib in folder Walkthrough, style4, name WalkthroughStyle4View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // call function for create WalkthroughStyle4View
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        
        // Create WalkthroughStyle4View
        viewer = Bundle.main.loadNibNamed("WalkthroughStyle4View", owner: nil, options: nil)?.first as! WalkthroughStyle4View
        viewer.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: self.view.frame.size.height-100-50)
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
