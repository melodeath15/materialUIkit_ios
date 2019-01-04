//
//  Style16Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class Style16Controller: UIViewController, UITableViewDelegate, UITableViewDataSource, HeaderStyle1Delegate, ButtonSyle6Delegate, FieldStyle6Delegate, FieldStyle11Delegate{
    
    private var tableSignUp: UITableView = UITableView() // table for sign up
    private var tableSignIn: UITableView = UITableView() // table for sign in
    var header = HeaderStyle1() // var view xib in folder style1 name HeaderStyle1
    var headerImg = ButtonSyle6() // var view xib in folder style1 name ButtonSyle6
    var tap = NSInteger() //show tap

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tap = 1 // show in sign in
        createView() // call function for create header Image, create header navigation, table and regis xib/UINib
    }
    
    func createView() {
        // Create Header Image
        headerImg = Bundle.main.loadNibNamed("ButtonSyle6", owner: nil, options: nil)?.first as! ButtonSyle6
        headerImg.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 166)
        headerImg.imgHeader.image = UIImage(named: "bg7")
        headerImg.changeIcon.isHidden = true
        headerImg.btnSignIn.setTitleColor(UIColor.white, for: .normal)
        headerImg.btnSignUp.setTitleColor(UIColor.lightGray, for: .normal)
        headerImg.delegate = self
        self.view.addSubview(headerImg)
        
        // Create Header Navigation
        header = Bundle.main.loadNibNamed("HeaderStyle1", owner: nil, options: nil)?.first as! HeaderStyle1
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.titleHeader.text = ""
        header.btnSearch.isHidden = true
        header.btnOption.isHidden = true
        header.backgroundColor = UIColor.clear
        header.delegate = self
        self.view.addSubview(header)
        
        // Create Table
        tableSignUp.frame = CGRect(x: 0, y: 166, width: self.view.frame.size.width, height: self.view.frame.size.height-166)
        tableSignUp.delegate = self;
        tableSignUp.dataSource = self;
        tableSignUp.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        tableSignUp.separatorColor = UIColor.clear
        tableSignUp.allowsSelection = false
        tableSignUp.isScrollEnabled = false
        tableSignUp.tag = 0
        
        // register UINib for FieldStyle6
        tableSignUp.register(UINib(nibName: "FieldStyle6", bundle: nil), forCellReuseIdentifier: "FieldStyle6")
        
        self.view .addSubview(tableSignUp)
        
        // Create Table1
        tableSignIn.frame = CGRect(x: 0, y: 166, width: self.view.frame.size.width, height: self.view.frame.size.height-166)
        tableSignIn.delegate = self;
        tableSignIn.dataSource = self;
        tableSignIn.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        tableSignIn.separatorColor = UIColor.clear
        tableSignIn.allowsSelection = false
        tableSignIn.isScrollEnabled = false
        tableSignIn.tag = 1
        
        // register UINib for FieldStyle11
        tableSignIn.register(UINib(nibName: "FieldStyle11", bundle: nil), forCellReuseIdentifier: "FieldStyle11")
        
        self.view .addSubview(tableSignIn)
        
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
        return 360
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FieldStyle6", for: indexPath) as! FieldStyle6
            cell.backgroundColor = UIColor.clear
            cell.delegate = self
            return cell
        }else if tableView.tag == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FieldStyle11", for: indexPath) as! FieldStyle11
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
        // function hidden
    }
    
    func MenuOption() { // function for menu option
        // function hidden
    }
    // end
    
    // Delegate FieldStyle6Delegate and FieldStyle11Delegatea
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
            print("Textfield Result FieldStyle4\(text)") // show all FieldStyle4
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
            print("Textfield Result FieldStyle11\(text)") // show all FieldStyle11
        }
    }
    
    func CreateAccount() { // function create account
        FunctionDefault.AlertMessage(title: "Create Account", message: "", targetVC: self)
    }
    
    func Term() { // function term of service
        FunctionDefault.AlertMessage(title: "Term of Service", message: "", targetVC: self)
    }
    // end
    
    // Delegate ButtonSyle6Delegate
    func SignUp() { // function tap button sign up
        tap = 1 // change tap
        tableSignUp.isHidden = false
        tableSignIn.isHidden = true
    }
    
    func SignIn() { // function tap button sign in
        tap = 0 // change tap
        tableSignUp.isHidden = true
        tableSignIn.isHidden = false
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
