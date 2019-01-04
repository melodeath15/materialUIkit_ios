//
//  Style22Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class Style22Controller: UIViewController, HeaderStyle1Delegate, ViewFooterStyle22Delegate {

    var header = HeaderStyle1() // var view xib in folder style1 name HeaderStyle1
    var viewhome = ViewStyle22() // var view xib in folder style22 name ViewStyle22
    var footer = ViewFooterStyle22() // var view xib in folder style22 name ViewFooterStyle22

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // call function for change color, create header, create view home, create footer
        
    }
    
    func createView() {
        // change color
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        
        // Create Header
        header = Bundle.main.loadNibNamed("HeaderStyle1", owner: nil, options: nil)?.first as! HeaderStyle1
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.titleHeader.text = ""
        header.btnSearch.isHidden = true
        header.btnOption.isHidden = true
        header.iconBack.setImage(UIImage(named: "menu1"), for: .normal)
        
        // function show or close menu left
        header.iconBack.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.addSubview(header)
        
        // Create View Home
        viewhome = Bundle.main.loadNibNamed("ViewStyle22", owner: nil, options: nil)?.first as! ViewStyle22
        viewhome.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 200)
        viewhome.center = view.center
        self.view.addSubview(viewhome)
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("ViewFooterStyle22", owner: nil, options: nil)?.first as! ViewFooterStyle22
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-60, width: self.view.frame.size.width, height: 60)
        footer.delegate = self
        self.view.addSubview(footer)
        
    }
    
    // Delegate HeaderStyle1Delegate
    func back1() { // function for back layout
        // function hidden for left menu
    }
    
    func search1() { // function for search
        // Function Hidden
    }
    
    func MenuOption() { // function for menu option
        // Function Hidden
    }
    // end
    
    // Delegate ViewFooterStyle22Delegate
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
