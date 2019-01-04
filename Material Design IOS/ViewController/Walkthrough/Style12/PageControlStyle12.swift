//
//  PageControlStyle12.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class PageControlStyle12: UIViewController, WalkthroughStyle5FooterDelegate {

    var footer = WalkthroughStyle5Footer() // var view xib in folder Walkthrough, style5, name WalkthroughStyle5Footer
    
    override func loadView() {
        super.loadView()
        
        createView() // call function for create footer
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("WalkthroughStyle5Footer", owner: nil, options: nil)?.first as! WalkthroughStyle5Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width, height: 50)
        footer.btnGetStarted.setTitle("GET STARTED", for: .normal)
        footer.delegate = self
        self.view.addSubview(footer)
        
    }
    
    // delegate WalkthroughStyle5Footer
    func getStarted() {// func btn get started
        FunctionDefault.AlertMessageAction(title: "Get Started", message: "", targetVC: self)
    }
    // end
    
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
