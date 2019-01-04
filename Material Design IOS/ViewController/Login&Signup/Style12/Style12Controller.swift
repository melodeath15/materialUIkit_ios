//
//  Style12Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class Style12Controller: UIViewController, UITableViewDataSource, UITableViewDelegate, HeaderStyle1Delegate, FieldStyle12Delegate {
 
    private var tableStyle: UITableView = UITableView()
    var header = HeaderStyle1() // var view xib in folder style1 name HeaderStyle1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // call function create backgraoud, create nav, create table and regis xib/UINib
    }
    
    func createView() {
        // Create Background
        let imageName = "bg3a"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        imageView.contentMode = .scaleAspectFill
        self.view.addSubview(imageView)
        
        // Create Nav
        header = Bundle.main.loadNibNamed("HeaderStyle1", owner: nil, options: nil)?.first as! HeaderStyle1
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.titleHeader.text = "Sign In"
        header.backgroundColor = UIColor.clear
        header.delegate = self
        self.view.addSubview(header)
        
        // Create Table
        tableStyle.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        tableStyle.delegate = self;
        tableStyle.dataSource = self;
        tableStyle.backgroundColor = UIColor.clear
        tableStyle.separatorColor = UIColor.clear
        tableStyle.allowsSelection = false
        tableStyle.isScrollEnabled = false
        
        // register UINib for FieldStyle12
        tableStyle.register(UINib(nibName: "FieldStyle12", bundle: nil), forCellReuseIdentifier: "FieldStyle12")
        
        self.view.addSubview(tableStyle)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 470
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FieldStyle12", for: indexPath) as! FieldStyle12
        cell.backgroundColor = UIColor.clear
        cell.delegate = self
        return cell
    }
    
    // Delegate HeaderStyle1Delegate
    func back1() { // function for back layout
        navigationController?.popViewController(animated: true)
    }
    
    func search1() { // function for search
        FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)
    }
    
    func MenuOption() { // function for menu option
        let actionSheet: UIAlertController = UIAlertController(title: "Choose Option", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {_ in // function for butoon down
            FunctionDefault.AlertMessage(title: "Cancel", message: "", targetVC: self)
        }
        actionSheet.addAction(cancelAction)
        
        
        let saveAction = UIAlertAction(title: "Save", style: .default){ _ in // function button custom
            FunctionDefault.AlertMessage(title: "Save", message: "", targetVC: self)
        }
        actionSheet.addAction(saveAction)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive){ _ in // function button custom with destructive
            FunctionDefault.AlertMessage(title: "Delete", message: "", targetVC: self)
        }
        actionSheet.addAction(deleteAction)
        
        actionSheet.popoverPresentationController?.sourceView = self.view
        actionSheet.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.width-20, y: 60, width: 1, height: 1)
        self.present(actionSheet, animated: true, completion: nil)
    }
    // end
    
    // Delegate FieldStyle12Delegate
    func textChange(text: String, tag: NSInteger) { // function for get textfield
        switch tag {
        case 0:
            // Textfield Username
            break
        case 1:
            // Textfield Password
            break
        default:
            break
        }
        print("Textfield Result \(text)") // show all textfield
    }
    
    func cekBoxStatus(status: M13Checkbox) { // function cek box
        FunctionDefault.AlertMessage(title: status.checkState.rawValue, message: "", targetVC: self)
    }
    
    func signIn() { // function sign in
        FunctionDefault.AlertMessage(title: "Sign In", message: "", targetVC: self)
    }
    
    func signUp() { // function sign up
        FunctionDefault.AlertMessage(title: "Sign Up", message: "", targetVC: self)
    }
    
    func signInFB() { // function sign in facebook
        FunctionDefault.AlertMessage(title: "Sign In Facebook", message: "", targetVC: self)
    }
    
    func forgotPassword() { // function forgot password
        FunctionDefault.AlertMessage(title: "Forgot Password", message: "", targetVC: self)
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
