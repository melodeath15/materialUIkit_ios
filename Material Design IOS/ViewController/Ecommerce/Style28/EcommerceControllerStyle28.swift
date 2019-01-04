//
//  EcommerceControllerStyle28.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle28: UIViewController, EcommerceStyle1HeaderDelegate, EcommerceStyle28ViewDelegate {
    
    var header = EcommerceStyle1Header()
    var viewCode = EcommerceStyle28View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create header
        header = Bundle.main.loadNibNamed("EcommerceStyle1Header", owner: nil, options: nil)?.first as! EcommerceStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Coupon Code"
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.btnBuy.isHidden = true
        header.delegate = self
        self.view.addSubview(header)
        
        // create viewCode
        viewCode = Bundle.main.loadNibNamed("EcommerceStyle28View", owner: nil, options: nil)?.first as! EcommerceStyle28View
        viewCode.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 330)
        viewCode.title.text = "Use your Coupon Code"
        viewCode.des.text = "Enter your code in promo code to get 50% on Products with Promo label"
        viewCode.code.text = "KX630ZD"
        viewCode.delegate = self
        self.view.addSubview(viewCode)
        
    }
    
    // EcommerceStyle1HeaderDelegate
    func menu() {
        navigationController?.popViewController(animated: true)
    }
    
    func buy() {
        // not use
    }
    // end
    
    // EcommerceStyle28ViewDelegate
    func useCode(code: String) {
        FunctionDefault.AlertMessage(title: "\(code)", message: "", targetVC: self)
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
