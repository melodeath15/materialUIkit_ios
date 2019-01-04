//
//  WalkthroughControllerStyle6.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/4/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class WalkthroughControllerStyle6: UIViewController {
    
    var viewer = WalkthroughStyle6View() // var view xib in folder Walkthrough, style6, name WalkthroughStyle6View

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // call function for create WalkthroughStyle6View
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)

        // Create WalkthroughStyle3View
        viewer = Bundle.main.loadNibNamed("WalkthroughStyle6View", owner: nil, options: nil)?.first as! WalkthroughStyle6View
        viewer.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: self.view.frame.size.height-160)
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
