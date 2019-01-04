//
//  ActivityStyle16Controller.swift
//  Material Design IOS
//
//  Created by yanuar prisantoso on 6/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ActivityStyle16Controller: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewActivityStyle1HeaderDelegate, ViewActivityStyle16ImageDelegate, ViewActivityStyle16TextFieldDelegate  {

    private var tableStyle: UITableView = UITableView() // var tableView
    var Nav = ViewActivityStyle1Header() // var view xib in folder style1 name ViewActivityStyle1Header
    var header = ViewActivityStyle16Image() // var view xib in folder style16 name ViewActivityStyle16Image
    var footer = ViewActivityStyle16TextField() // var view xib in folder syle16 name ViewActivityStyle16TextField
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // function for create nav, create header, create table and regis UINib, create footer
    }
    
    func createView(){
        
        // Create Nav
        Nav = Bundle.main.loadNibNamed("ViewActivityStyle1Header", owner: nil, options: nil)?.first as! ViewActivityStyle1Header
        Nav.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        Nav.iconBack.setImage(UIImage(named: "menu1"), for: .normal)
        Nav.btnWrite.isHidden = true
        
        // function show or close menu left
        Nav.iconBack.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        Nav.delegate = self
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        self.view.addSubview(Nav)
        
        // create header
        header = Bundle.main.loadNibNamed("ViewActivityStyle16Image", owner: nil, options: nil)?.first as! ViewActivityStyle16Image
        header.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 215)
        
        let stringMain = "Gabrielle Madelaine Liked a Post"
        let stringDefault = "Liked a Post "
        
        let locDefault = stringMain.characters.count-stringDefault.characters.count
        
        let stringAttributed = NSMutableAttributedString.init(string: "Gabrielle Madelaine Liked a Post")
        let font = UIFont(name: "verdana", size: 12)
        
        stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
        header.name?.attributedText = stringAttributed
        
        header.profileImg.image = #imageLiteral(resourceName: "profile1")
        header.time.text = "14.30"
        header.title.text = "Introduction to UX Designs"
        header.posted.text = "Posted by Tony Ramirez"
        header.des.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and altruistic amiable far much foward"
        header.valueLove.text = "1347"
        header.valueView.text = "19789"
        header.delegate = self
        self.view.addSubview(header)
        
        
        // Create Table
        tableStyle.frame = CGRect(x: 0, y: 300, width: self.view.frame.size.width, height: self.view.frame.size.height-300-55)
        tableStyle.delegate = self;
        tableStyle.dataSource = self;
        tableStyle.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        tableStyle.separatorColor = UIColor.clear
        tableStyle.allowsSelection = false
        
        
        // register UINib for ViewActivityStyle16Text
        tableStyle.register(UINib(nibName: "ViewActivityStyle16Text", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle16Text")
        self.view .addSubview(tableStyle)
        
        // create footer
        footer = Bundle.main.loadNibNamed("ViewActivityStyle16TextField", owner: nil, options: nil)?.first as! ViewActivityStyle16TextField
        footer.frame = CGRect(x: 10, y: self.view.frame.size.height-55, width: self.view.frame.size.width-20, height: 55)
        footer.textFieldComment.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        footer.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        footer.delegate = self
        self.view.addSubview(footer)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle16Text", for: indexPath) as! ViewActivityStyle16Text
        
        switch indexPath.row {
        case 0:
            
            let stringMain = "Tony Ramirez Nice Photo!"
            let stringDefault = "Nice Photo! "
            
            let locDefault = stringMain.characters.count-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Tony Ramirez Nice Photo!")
            let font = UIFont(name: "verdana", size: 12)
            
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            cell.titile?.attributedText = stringAttributed
            cell.time.text = "An hour ago"
            cell.imgProfile.image = #imageLiteral(resourceName: "profile2")
        case 1:
            
            let stringMain = "Ludwing I love how you took it on white!"
            let stringDefault = "I love how you took it on white!"
            
            let locDefault = stringMain.characters.count-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Ludwing I love how you took it on white!")
            let font = UIFont(name: "verdana", size: 12)
            
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            cell.titile?.attributedText = stringAttributed
            cell.time.text = "3 hour ago"
            cell.imgProfile.image = #imageLiteral(resourceName: "profile3")
        case 2:
            
            let stringMain = "Christina You're awsome!"
            let stringDefault = "You're awsome! "
            
            let locDefault = stringMain.characters.count-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Christina You're awsome!")
            let font = UIFont(name: "verdana", size: 12)
            
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            cell.titile?.attributedText = stringAttributed
            cell.time.text = "An hour ago"
            cell.imgProfile.image = #imageLiteral(resourceName: "profile1")
        case 3:
            
            let stringMain = "Remi Boucher Wow!"
            let stringDefault = "Wow! "
            
            let locDefault = stringMain.characters.count-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Remi Boucher Wow!")
            let font = UIFont(name: "verdana", size: 12)
            
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            cell.titile?.attributedText = stringAttributed
            cell.time.text = "3 hour ago"
            cell.imgProfile.image = #imageLiteral(resourceName: "profile2")
        case 4:
            
            let stringMain = "Ludwing I love how you took it on white!"
            let stringDefault = "I love how you took it on white! "
            
            let locDefault = stringMain.characters.count-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Ludwing I love how you took it on white!")
            let font = UIFont(name: "verdana", size: 12)
            
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            cell.titile?.attributedText = stringAttributed
            cell.time.text = "3 hour ago"
            cell.imgProfile.image = #imageLiteral(resourceName: "profile3")
        default:
            break
        }
        
        
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    // ViewActivityStyle1HeaderDelegate
    func MenuOrBack() { // function for back layout
        // function hidden for left menu
    }
    
    func Write() { // function for write
        FunctionDefault.AlertMessage(title: "Write", message: "", targetVC: self)
    }
    
    func Search() { // function for search
        FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)
    }
    
    func Option() { // function for menu option
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
    
    // ViewActivityStyle16ImageDelegate
    func like(){
        FunctionDefault.AlertMessage(title: "Like", message:"", targetVC: self)
    }
    // end
    
    // ViewActivityStyle16TextFieldDelegate
    func textChange(text: String, tag: NSInteger) {
        print("Textfield Result \(text)") // textfield
    }
    
    func Send() {
        FunctionDefault.AlertMessage(title: "Push Send", message:"", targetVC: self)
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
 
