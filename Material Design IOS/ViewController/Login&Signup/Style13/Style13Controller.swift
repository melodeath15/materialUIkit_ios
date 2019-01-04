//
//  Style13Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class Style13Controller: UIViewController, HeaderStyle1Delegate, FieldStyle13Delegate, ButtonStyle3Delegate {
    
    var header = HeaderStyle1() // var view xib in folder style1 name HeaderStyle1
    var field = FieldStyle13() // var view xib in folder style13 name FieldStyle13
    var footer = ButtonStyle3() // var view xib in folder style3 name ButtonStyle3

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // call function for create background, create header, create field, create footer
    }

    func createView() {
        // Create Background
        let imageName = "bg5"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        imageView.contentMode = .scaleAspectFill
        self.view.addSubview(imageView)
        
        // Create Header
        header = Bundle.main.loadNibNamed("HeaderStyle1", owner: nil, options: nil)?.first as! HeaderStyle1
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.titleHeader.text = "Sign In"
        header.backgroundColor = UIColor.clear
        header.delegate = self
        self.view.addSubview(header)
        
        // Create Field
        field = Bundle.main.loadNibNamed("FieldStyle13", owner: nil, options: nil)?.first as! FieldStyle13
        field.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 150)
        field.center = view.center
        field.backgroundColor = UIColor.clear
        field.delegate = self
        self.view.addSubview(field)
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("ButtonStyle3", owner: nil, options: nil)?.first as! ButtonStyle3
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width, height: 50)
        footer.changeButton.setTitle("Sign In", for: .normal)
        footer.backgroundColor = UIColor.clear
        footer.delegate = self
        self.view.addSubview(footer)
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
    
    // Delegate FieldStyle13Delegate
    func textChange(text: String, tag: NSInteger) { // function for get textfield
        switch tag {
        case 0:
            // Textfield Username
            break
        case 1:
            // Textfield password
            break
        default:
            break
        }
        print("Textfield Result \(text)") // show all textfield
    }
    
    func cekBoxStatus(status: M13Checkbox) { // function cek box
        FunctionDefault.AlertMessage(title: status.checkState.rawValue, message: "", targetVC: self)
    }
    
    func forgotPassword() { // funcrtion forgot password
        FunctionDefault.AlertMessage(title: "Forgot Password", message: "", targetVC: self)
    }
    // end
    
    // Delegate ButtonStyle3Delegate
    func CreateAccount() { // function create account
        FunctionDefault.AlertMessage(title: "Sign In", message: "", targetVC: self)
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
