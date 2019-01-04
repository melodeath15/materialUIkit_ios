//
//  Style25Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class Style25Controller: UIViewController, HeaderStyle1Delegate, ViewStyle25Delegate {
    
    var Nav = HeaderStyle1() // var view xib in folder style1 name HeaderStyle1
    var header = HeaderStyle25() // var view xib in folder style25 name HeaderStyle25
    var ViewMenu = ViewStyle25() // var view xib in folder style25 name ViewStyle25

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // call function for create header, create navigation, create view menu
    }
    
    func createView() {
        // Create Header
        header = Bundle.main.loadNibNamed("HeaderStyle25", owner: nil, options: nil)?.first as! HeaderStyle25
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height/2)
        self.view.addSubview(header)
        
        // Create Navigation
        Nav = Bundle.main.loadNibNamed("HeaderStyle1", owner: nil, options: nil)?.first as! HeaderStyle1
        Nav.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        Nav.backgroundColor = UIColor.clear
        Nav.titleHeader.text = ""
        Nav.btnSearch.isHidden = true
        Nav.btnOption.isHidden = true
        Nav.iconBack.setImage(UIImage(named: "menu1"), for: .normal)
        
        // function show or close menu left
        Nav.iconBack.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        Nav.delegate = self
        self.view.addSubview(Nav)
        
        // Create View Menu
        ViewMenu = Bundle.main.loadNibNamed("ViewStyle25", owner: nil, options: nil)?.first as! ViewStyle25
        ViewMenu.frame = CGRect(x: 0, y: self.view.frame.size.height/2-50, width: self.view.frame.size.width, height: self.view.frame.size.height/2)
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
    
    // Delegate ViewStyle25Delegate
    func SignIn() { // function sign in
        FunctionDefault.AlertMessage(title: "Sign In", message: "", targetVC: self)
    }
    
    func SignUp() { // function sign up
        FunctionDefault.AlertMessage(title: "Sign Up", message: "", targetVC: self)
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
