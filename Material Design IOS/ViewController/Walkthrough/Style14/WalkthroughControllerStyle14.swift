//
//  WalkthroughControllerStyle14.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/4/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class WalkthroughControllerStyle14: UIViewController {

    var viewBg = WalkthroughStyle14Bg() // var view xib in folder Walktrhrough, style14 name WalkthroughStyle14Bg
    var viewer = WalkthroughStyle13View() // var view xib in folder Walkthrough, style13, name WalkthroughStyle13View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // call function for create WalkthroughStyle13View, WalkthroughStyle14Bg
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 45/255.0, green: 57/255.0, blue: 67/255.0, alpha: 1.0)
        
        // Create WalkthroughStyle14Bg
        viewBg = Bundle.main.loadNibNamed("WalkthroughStyle14Bg", owner: nil, options: nil)?.first as! WalkthroughStyle14Bg
        viewBg.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height+20)
        self.view.addSubview(viewBg)
        
        // Create WalkthroughStyle13View
        viewer = Bundle.main.loadNibNamed("WalkthroughStyle13View", owner: nil, options: nil)?.first as! WalkthroughStyle13View
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
