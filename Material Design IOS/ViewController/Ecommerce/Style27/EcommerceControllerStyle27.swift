//
//  EcommerceControllerStyle27.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle27: UIViewController, EcommerceStyle27FooterDelegate {

    var viewSucses = EcommerceStyle27View()
    var footer = EcommerceStyle27Footer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create viewCode
        viewSucses = Bundle.main.loadNibNamed("EcommerceStyle27View", owner: nil, options: nil)?.first as! EcommerceStyle27View
        viewSucses.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 330)
        viewSucses.title.text = "Your Order is Successfull"
        viewSucses.des.text = "Your items will be processed as soon as possible"
        self.view.addSubview(viewSucses)

        // create footer
        footer = Bundle.main.loadNibNamed("EcommerceStyle27Footer", owner: nil, options: nil)?.first as! EcommerceStyle27Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-60, width: self.view.frame.size.width, height: 60)
        footer.delegate = self
        self.view.addSubview(footer)
        
    }
        
    // EcommerceStyle27FooterDelegate
    func pushOk() {
        FunctionDefault.AlertMessageAction(title: "OK", message: "", targetVC: self)
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
