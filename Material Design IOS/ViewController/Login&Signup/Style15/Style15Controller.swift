//
//  Style15Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class Style15Controller: UIViewController, UITableViewDelegate, UITableViewDataSource, HeaderStyle1Delegate, FieldStyle5Delegate, ButtonSyle5Delegate, FieldStyle15Delegate {
    
    private var tableSignUp: UITableView = UITableView() // table for sign up
    private var tableSignIn: UITableView = UITableView() // table for sign in
    var header = HeaderStyle1() // var view xib in folder style1 name HeaderStyle1
    var tap = NSInteger() //show tap

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tap = 1 // show in sign in
        createView() // call function for create background, table and regis xib/UINib, create header
    }
    
    func createView() {
        // Create Background
        let imageName = "bg6"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        
        // Create Table
        tableSignUp.frame = CGRect(x: 0, y: 30, width: self.view.frame.size.width, height: self.view.frame.size.height-30)
        tableSignUp.delegate = self;
        tableSignUp.dataSource = self;
        tableSignUp.backgroundColor = UIColor.clear
        tableSignUp.separatorColor = UIColor.clear
        tableSignUp.allowsSelection = false
        tableSignUp.isScrollEnabled = false
        tableSignUp.tag = 0
        
        // register UINib for LogoStyle1, FieldStyle5, ButtonSyle5
        tableSignUp.register(UINib(nibName: "LogoStyle1", bundle: nil), forCellReuseIdentifier: "LogoStyle1")
        tableSignUp.register(UINib(nibName: "FieldStyle5", bundle: nil), forCellReuseIdentifier: "FieldStyle5")
        tableSignUp.register(UINib(nibName: "ButtonSyle5", bundle: nil), forCellReuseIdentifier: "ButtonSyle5")
        
        self.view .addSubview(tableSignUp)
        
        // Create Table1
        tableSignIn.frame = CGRect(x: 0, y: 30, width: self.view.frame.size.width, height: self.view.frame.size.height-30)
        tableSignIn.delegate = self;
        tableSignIn.dataSource = self;
        tableSignIn.backgroundColor = UIColor.clear
        tableSignIn.separatorColor = UIColor.clear
        tableSignIn.allowsSelection = false
        tableSignIn.isScrollEnabled = false
        tableSignIn.tag = 1
        
        // register UINib for LogoStyle1, FieldStyle15, ButtonSyle5
        tableSignIn.register(UINib(nibName: "LogoStyle1", bundle: nil), forCellReuseIdentifier: "LogoStyle1")
        tableSignIn.register(UINib(nibName: "FieldStyle15", bundle: nil), forCellReuseIdentifier: "FieldStyle15")
        tableSignIn.register(UINib(nibName: "ButtonSyle5", bundle: nil), forCellReuseIdentifier: "ButtonSyle5")
        
        self.view .addSubview(tableSignIn)
        
        
        // Create Header
        header = Bundle.main.loadNibNamed("HeaderStyle1", owner: nil, options: nil)?.first as! HeaderStyle1
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.titleHeader.text = ""
        header.btnSearch.isHidden = true
        header.btnOption.isHidden = true
        header.backgroundColor = UIColor.clear
        header.delegate = self
        self.view.addSubview(header)
        
        if tap == 0 {
            SingUp()
        }else if tap == 1{
            SignIn()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        }else if indexPath.row == 1{
            return 80
        }else if indexPath.row == 2{
            return 360
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LogoStyle1", for: indexPath) as! LogoStyle1
            cell.backgroundColor = UIColor.clear
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonSyle5", for: indexPath) as! ButtonSyle5
            
            if tableView.tag == 1 {
                // for set color button signin n signup
                cell.btnSIgnIn.backgroundColor = UIColor.white
                cell.btnSIgnIn.setTitleColor(UIColor.black, for: .normal)
                cell.btnSignUp.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
                cell.btnSignUp.setTitleColor(UIColor.lightGray, for: .normal)
                //end
            }else if tableView.tag == 0{
                // for set color button signin n signup
                cell.btnSIgnIn.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
                cell.btnSIgnIn.setTitleColor(UIColor.lightGray, for: .normal)
                cell.btnSignUp.backgroundColor = UIColor.white
                cell.btnSignUp.setTitleColor(UIColor.black, for: .normal)
                // end
            }
            
            cell.backgroundColor = UIColor.clear
            cell.delegate = self
            return cell
        case 2:
            if tableView.tag == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "FieldStyle5", for: indexPath) as! FieldStyle5
                cell.viewBg.backgroundColor = UIColor.white
                cell.backgroundColor = UIColor.clear
                cell.delegate = self
                return cell

            }else if tableView.tag == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "FieldStyle15", for: indexPath) as! FieldStyle15
                cell.viewBg.backgroundColor = UIColor.white
                cell.backgroundColor = UIColor.clear
                cell.delegate = self
                return cell
            }
        default:
            break
        }
        
        let cell = UITableViewCell() // cell nil
        return cell
    }
    
    // Delegate HeaderStyle1Delegate
    func back1() { // function for back layout
        navigationController?.popViewController(animated: true)
    }
    
    func search1() { // function for search
        // function is hidden
    }
    
    func MenuOption() { // function for menu option
        // function is hidden
    }
    // end
    
    // Delegate FieldStyle5Delegate and FieldStyle15Delegate
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
            print("Textfield Result FieldStyle5\(text)") // show all FieldStyle5
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
            print("Textfield Result FieldStyle15\(text)") // show all FieldStyle15
        }
    }
    
    func LoginFB() { // function login facebook
        FunctionDefault.AlertMessage(title: "Login Facebook", message: "", targetVC: self)
    }
    
    func createAccount() { // function create account
        FunctionDefault.AlertMessage(title: "Create Account", message: "", targetVC: self)
    }
    // end
    
    // Delegate ButtonSyle5Delegate
    func SingUp() { // function tap button sign up
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
    
    // Delegate FieldStyle15Delegate\
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
