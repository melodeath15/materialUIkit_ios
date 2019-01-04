//
//  Style21Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class Style21Controller: UIViewController, ViewStyle21Delegate, View2Style21Delegate {
    
    var view1 = ViewStyle21() // var view xib in folder style21 name ViewStyle21
    var view2 = View2Style21() // var view xib in folder style21 name View2Style21
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // call function create view for, View1 and View2
    }

    func createView() {
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        
        // Create View1
        view1 = Bundle.main.loadNibNamed("ViewStyle21", owner: nil, options: nil)?.first as! ViewStyle21
        view1.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height/2)
        view1.delegate = self
        self.view.addSubview(view1)
        
        // Create View2
        view2 = Bundle.main.loadNibNamed("View2Style21", owner: nil, options: nil)?.first as! View2Style21
        view2.frame = CGRect(x: 0, y: self.view.frame.size.height/2, width: self.view.frame.size.width, height: self.view.frame.size.height/2)
        view2.delegate = self
        self.view.addSubview(view2)
    }
    
    func signup() { // function sign up
        FunctionDefault.AlertMessage(title: "Sign Up", message: "", targetVC: self)
        navigationController?.popViewController(animated: true)
    }
    
    func signin() { // function sign in
        FunctionDefault.AlertMessage(title: "Sign In", message: "", targetVC: self)
        navigationController?.popViewController(animated: true)
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
