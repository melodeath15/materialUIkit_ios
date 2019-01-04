//
//  Style23Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class Style23Controller: UIViewController, HeaderStyle1Delegate, ViewStyle23Delegate {
    
    var Nav = HeaderStyle1() // var view xib in folder style1 name HeaderStyle1
    var ViewMenu = ViewStyle23() // var view xib in folder style23 name ViewStyle23

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // call function for create navigation, create view menu
    }

    func createView() {
        // change color
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        
        // Create Navigation
        Nav = Bundle.main.loadNibNamed("HeaderStyle1", owner: nil, options: nil)?.first as! HeaderStyle1
        Nav.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        Nav.titleHeader.text = "Forgot Password"
        Nav.btnOption.isHidden = true
        Nav.btnSearch.isHidden = true
        Nav.delegate = self
        self.view.addSubview(Nav)
        
        
        // Create View Menu
        ViewMenu = Bundle.main.loadNibNamed("ViewStyle23", owner: nil, options: nil)?.first as! ViewStyle23
        ViewMenu.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 250)
        ViewMenu.center = view.center
        ViewMenu.delegate = self
        self.view.addSubview(ViewMenu)
        
    }
    
    // Delegate HeaderStyle1Delegate
    func back1() { // function for back layout
        navigationController?.popViewController(animated: true)
    }
    
    func search1() { // function for search
        // Function Hidden
    }
    
    func MenuOption() { // function for menu option
        // Function Hidden
    }
    // end
    
    // Delegate ViewStyle23Delegate
    func textChange(text: String, tag: NSInteger) { // function for get textfield
        switch tag {
        case 0:
            // Textfield Email
            break
        default:
            break
        }
        print("Textfield Result \(text)") // show all textfield
    }
    
    func resetPassword() { // function reset password
        FunctionDefault.AlertMessage(title: "Reset Password", message: "", targetVC: self)
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
