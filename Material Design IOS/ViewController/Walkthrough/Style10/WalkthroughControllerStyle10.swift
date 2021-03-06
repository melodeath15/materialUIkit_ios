//
//  WalkthroughControllerStyle10.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/4/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class WalkthroughControllerStyle10: UIViewController {

    var viewer = WalkthroughStyle5View() // var view xib in folder Walkthrough, style5, name WalkthroughStyle5View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // call function for create WalkthroughStyle5View
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.white
        
        // Create WalkthroughStyle5View
        viewer = Bundle.main.loadNibNamed("WalkthroughStyle5View", owner: nil, options: nil)?.first as! WalkthroughStyle5View
        viewer.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-120)
        viewer.title.text = "Overview"
        viewer.des.text = "Making Friends is easy as waving your hand back and forth"
        viewer.img.image = #imageLiteral(resourceName: "WalkthroughStyle10")
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
