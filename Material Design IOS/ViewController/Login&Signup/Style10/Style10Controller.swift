//
//  Style10Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class Style10Controller: UIViewController, HeaderStyle1Delegate, ViewStyle20Delegate, FieldStyle10Delegate {
    
    var header = HeaderStyle1() // var view xib in folder style1 name HeaderStyle1
    var ViewSignIn = ViewStyle20() // var view xib in folder style20 name ViewStyle20
    var ViewSignUp = FieldStyle10() // var view xib in folder style10 name FieldStyle10
    var viewBg = UIView() // backgraund grayscale
    var show = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // call function for, create background, create nav, create viewbg, create viewsignin, viewsingup
    }
    
    func createView() {
        // Create Background
        let imageView = UIImageView(image: UIImage(named: "bg4a"))
        imageView.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height)
        imageView.contentMode = .scaleAspectFill
        self.view.addSubview(imageView)
        
        // Create Nav
        header = Bundle.main.loadNibNamed("HeaderStyle1", owner: nil, options: nil)?.first as! HeaderStyle1
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.titleHeader.text = "Welcome"
        header.delegate = self
        self.view.addSubview(header)
        
        // Create ViewBg
        viewBg.frame = CGRect(x: 20, y: 120, width: self.view.frame.size.width-40, height: self.view.frame.size.height-170)
        viewBg.backgroundColor = UIColor.groupTableViewBackground
        self.view.addSubview(viewBg)
        
        // Create ViewSignIn
        ViewSignIn = Bundle.main.loadNibNamed("ViewStyle20", owner: nil, options: nil)?.first as! ViewStyle20
        ViewSignIn.frame = CGRect(x: 0, y: 140, width: self.view.frame.size.width, height: self.view.frame.size.height-160)
        ViewSignIn.btnFacebook.setTitle("Sign In With Facebook", for: .normal)
        ViewSignIn.delegate = self
        self.view.addSubview(ViewSignIn)
        
        // Create ViewSignUp
        ViewSignUp = Bundle.main.loadNibNamed("FieldStyle10", owner: nil, options: nil)?.first as! FieldStyle10
        ViewSignUp.frame = CGRect(x: 0, y: 140, width: self.view.frame.size.width, height: self.view.frame.size.height-160)
        ViewSignUp.delegate = self
        self.view.addSubview(ViewSignUp)
        
        // function pangesture recogonizer swep
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(actionGesture(gesture:)))
        self.view.addGestureRecognizer(gestureRecognizer)
    }
    
    func actionGesture(gesture: UIPanGestureRecognizer){ // function gestur swap
        
        let velocity = gesture.velocity(in: self.view)
        
        if show {
            if(velocity.x > 0){
                //print("gesture moving right")
                UIView.animate(withDuration: 1, animations: {
                    self.ViewSignUp.frame.origin.x += self.view.frame.size.width
                    self.ViewSignUp.frame.origin.y += 0
                    
                }, completion: { (Bool) in
                    self.ViewSignUp.frame.origin.x -= self.view.frame.size.width
                    self.ViewSignUp.frame.origin.y += 0
                    self.ViewSignUp.isHidden = true
                    self.show = false
                })
                
                
            }
            else{
                //print("gesture moving left")
                UIView.animate(withDuration: 1, animations: {
                    self.ViewSignUp.frame.origin.x -= self.view.frame.size.width
                    self.ViewSignUp.frame.origin.y += 0
                    
                }, completion: { (Bool) in
                    self.ViewSignUp.frame.origin.x += self.view.frame.size.width
                    self.ViewSignUp.frame.origin.y += 0
                    self.ViewSignUp.isHidden = true
                    self.show = false
                })
            }
            
        }else{
            if(velocity.x > 0){
                //print("gesture moving right")
                UIView.animate(withDuration: 1, animations: {
                    self.ViewSignIn.frame.origin.x += self.view.frame.size.width
                    self.ViewSignIn.frame.origin.y += 0
                    
                }, completion: { (Bool) in
                    self.ViewSignIn.frame.origin.x -= self.view.frame.size.width
                    self.ViewSignIn.frame.origin.y += 0
                    self.ViewSignUp.isHidden = false
                    self.show = true
                })
                
                
            }
            else{
                //print("gesture moving left")
                UIView.animate(withDuration: 1, animations: {
                    self.ViewSignIn.frame.origin.x -= self.view.frame.size.width
                    self.ViewSignIn.frame.origin.y += 0
                    
                }, completion: { (Bool) in
                    self.ViewSignIn.frame.origin.x += self.view.frame.size.width
                    self.ViewSignIn.frame.origin.y += 0
                    self.ViewSignUp.isHidden = false
                    self.show = true
                })
            }
            
        }
        
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
    
    // Delegate ViewStyle20Delegate and FieldStyle10Delegate
    func textChange(text: String, tag: NSInteger) { // function for get textfield
        if show == true{
            print("Sign Up")
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
            print("Textfield Result SignUp = \(text)") // show all ViewStyle20Delegate
            
        }else if show == false{
            print("Sign In")
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
            print("Textfield Result Sign In = \(text)") // show all FieldStyle10Delegate

        }
    }
    
    func cekBoxStatus(status: M13Checkbox) { // function cek box
        FunctionDefault.AlertMessage(title: status.checkState.rawValue, message: "", targetVC: self)
    }
    
    func forgotPassword() { // function forgot password
        FunctionDefault.AlertMessage(title: "Forgot Password", message: "", targetVC: self)
    }
    
    func signIn() { // function sign in
        FunctionDefault.AlertMessage(title: "Sign In", message: "", targetVC: self)
    }
    
    func loginFb() { // function login facebook
        FunctionDefault.AlertMessage(title: "Login Facebook", message: "", targetVC: self)
    }
    // end
    
    // FieldStyle10Delegate
    func LoginFb() { // function sign up facebook
        FunctionDefault.AlertMessage(title: "Sign Up Facebook", message: "", targetVC: self)
    }
    
    func CreateAccount() { // function create account
        FunctionDefault.AlertMessage(title: "Create Account", message: "", targetVC: self)
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
