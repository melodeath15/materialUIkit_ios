//
//  Style17Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class Style17Controller: UIViewController, UITableViewDelegate, UITableViewDataSource, HeaderStyle1Delegate, FieldStyle7Delegate, TapSwepStyle4Delegate, FieldStyle17Delegate {
    
    private var tableSignUp: UITableView = UITableView() // table for signup
    private var tableSignIn: UITableView = UITableView() // table for signin
    var header = HeaderStyle1() // var view xib in folder style1 name HeaderStyle1
    var headerMenu = TapSwepStyle4() // var view xib in folder style4 name TapSwepStyle4
    var tap = NSInteger() //show tap

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tap = 1
        createView() // call function create view for create header, create header menu, table and regis xib/UINib
    }
    
    func createView() {
        
        // Create Header
        header = Bundle.main.loadNibNamed("HeaderStyle1", owner: nil, options: nil)?.first as! HeaderStyle1
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.titleHeader.text = "Welcome"
        header.delegate = self
        self.view.addSubview(header)
        
        // Create Header Menu
        headerMenu = Bundle.main.loadNibNamed("TapSwepStyle4", owner: nil, options: nil)?.first as! TapSwepStyle4
        headerMenu.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 50)
        
        headerMenu.btnSignUp.setTitleColor(UIColor.lightText, for: .normal)
        headerMenu.btnSIgnIn.setTitleColor(UIColor.white, for: .normal)
        headerMenu.viewButton.isHidden = true
        headerMenu.viewButton2.isHidden = false
        
        headerMenu.delegate = self
        self.view.addSubview(headerMenu)
        
        // Create Table tableSignUp
        tableSignUp.frame = CGRect(x: 0, y: 130, width: self.view.frame.size.width, height: self.view.frame.size.height-130)
        tableSignUp.delegate = self;
        tableSignUp.dataSource = self;
        tableSignUp.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        tableSignUp.separatorColor = UIColor.clear
        tableSignUp.allowsSelection = false
        tableSignUp.isScrollEnabled = false
        tableSignUp.tag = 0
        
        // register UINib for FieldStyle7
        tableSignUp.register(UINib(nibName: "FieldStyle7", bundle: nil), forCellReuseIdentifier: "FieldStyle7")
        
        // Create Table tableSignIn
        tableSignIn.frame = CGRect(x: 0, y: 130, width: self.view.frame.size.width, height: self.view.frame.size.height-130)
        tableSignIn.delegate = self;
        tableSignIn.dataSource = self;
        tableSignIn.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        tableSignIn.separatorColor = UIColor.clear
        tableSignIn.allowsSelection = false
        tableSignIn.isScrollEnabled = false
        tableSignIn.tag = 1
        
        // register UINib for FieldStyle17
        tableSignIn.register(UINib(nibName: "FieldStyle17", bundle: nil), forCellReuseIdentifier: "FieldStyle17")
        
        self.view.addSubview(tableSignIn)
        self.view.addSubview(tableSignUp)
        
        if tap == 0 {
            SignUp()
        }else if tap == 1{
            SignIn()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 0 {
            return 440
        }else if tableView.tag == 1{
            return 350
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FieldStyle7", for: indexPath) as! FieldStyle7
            cell.backgroundColor = UIColor.clear
            cell.delegate = self
            return cell
        }else if tableView.tag == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FieldStyle17", for: indexPath) as! FieldStyle17
            cell.backgroundColor = UIColor.clear
            cell.delegate = self
            return cell

        }
        
        let cell = UITableViewCell() // cell nil
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
    
    // Delegate FieldStyle7Delegate and FieldStyle17Delegate
    func textChange(text: String, tag: NSInteger) { // function for get textfield
        if tap == 0{
            switch tag {
            case 0:
                // Textfield Fullname
                break
            case 1:
                // Textfield Username
                break
            case 2:
                // Textfield Email
                break
            case 3:
                // Textfield Password
                break
            case 4:
                // Textfield Confirm Password
                break
            default:
                break
            }
            print("Textfield Result FieldStyle7\(text)") // show all FieldStyle7
        }else if tap == 1{
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
            print("Textfield Result FieldStyle17\(text)") // show all FieldStyle17
        }
    }
    
    func CreateAccount() { // function create account
        FunctionDefault.AlertMessage(title: "Create Account", message: "", targetVC: self)
    }
    
    func LoginFb() { // function login facebook
        FunctionDefault.AlertMessage(title: "Login Facebook", message: "", targetVC: self)
    }
    
    func Term() { // function term of service
        FunctionDefault.AlertMessage(title: "Term of Service", message: "", targetVC: self)
    }
    // end
    
    // Delegate TapSwepStyle4Delegate
    func SignIn() { // function tap button sign in
        tap = 1 // change tap
        tableSignUp.isHidden = true
        tableSignIn.isHidden = false
    }
    
    func SignUp() { // function tap button sign up
        tap = 0 // change tap
        tableSignUp.isHidden = false
        tableSignIn.isHidden = true
    }
    // end
    
    // Delegate FieldStyle11Delegate
    func cekBoxStatus(status: M13Checkbox) { // function cek box
        FunctionDefault.AlertMessage(title: status.checkState.rawValue, message: "", targetVC: self)
    }
    
    func forgotPassword() { // function forgot password
        FunctionDefault.AlertMessage(title: "Forgot Password", message: "", targetVC: self)
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
