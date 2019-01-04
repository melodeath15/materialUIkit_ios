//
//  ActivityStyle18Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ActivityStyle18Controller: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewActivityStyle1HeaderDelegate, TextFieldActivityStyle9Delegate {
    
    private var tableStyle: UITableView = UITableView() // var tableView
    var header = ViewActivityStyle1Header() // var view xib in folder style1 name ViewActivityStyle1Header
    var footer = TextFieldActivityStyle9() // var view xib in folder style9 name TextFieldActivityStyle9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // function for create header, create table and regis UINib
    }
    
    func createView(){
        
        // Create Table
        tableStyle.frame = CGRect(x: 0, y: -20, width: self.view.frame.size.width, height: self.view.frame.size.height+20-50)
        tableStyle.delegate = self;
        tableStyle.dataSource = self;
        tableStyle.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        tableStyle.separatorColor = UIColor.clear
        tableStyle.allowsSelection = false
        
        // register UINib for ViewActivityStyle10
        tableStyle.register(UINib(nibName: "ViewActivityStyle10", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle10")
        tableStyle.register(UINib(nibName: "ViewActivityStyle9TextAll", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle9TextAll")
        self.view .addSubview(tableStyle)
        
        // Create Header
        header = Bundle.main.loadNibNamed("ViewActivityStyle1Header", owner: nil, options: nil)?.first as! ViewActivityStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.iconBack.setImage(UIImage(named: "menu1"), for: .normal)
        header.btnWrite.isHidden = true
        header.backgroundColor = UIColor.clear
        
        // function show or close menu left
        header.iconBack.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        self.view.addSubview(header)
        
        // create footer
        footer = Bundle.main.loadNibNamed("TextFieldActivityStyle9", owner: nil, options: nil)?.first as! TextFieldActivityStyle9
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width, height: 50)
        footer.delegate = self
        self.view.addSubview(footer)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrolloffset = scrollView.contentOffset.y
        
        if scrolloffset < 80{
            UIView.animate(withDuration: 1, animations:{
                self.header.backgroundColor = UIColor.clear
            }, completion: nil)
        }else if scrolloffset > 80{
            UIView.animate(withDuration: 1, animations:{
                self.header.backgroundColor = UIColor.init(red: 248/255.0, green: 86/255.0, blue: 33/255.0, alpha: 1.0)
            }, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.view.frame.size.height/2
        }else{
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle10", for: indexPath) as! ViewActivityStyle10
            
            cell.bgCell.image = #imageLiteral(resourceName: "As9.2")
            cell.imgProfile.image = #imageLiteral(resourceName: "profile1")
            cell.name.text = "Christina"
            cell.time.text = "An hour ago"
            cell.title.text = "Japanese Dining"
            cell.des.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and alturuistic"
            cell.valueLove.text = "1347"
            cell.valueView.text = "19789"
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle9TextAll", for: indexPath) as! ViewActivityStyle9TextAll
            
            switch indexPath.row {
            case 0:
                
                let stringMain = "Tony Ramirez Nice Photo!"
                let stringDefault = "Nice Photo! "
                
                let locDefault = stringMain.characters.count-stringDefault.characters.count
                
                let stringAttributed = NSMutableAttributedString.init(string: "Tony Ramirez Nice Photo!")
                let font = UIFont(name: "verdana", size: 12)
                
                stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
                cell.Title?.attributedText = stringAttributed
                cell.time.text = "An hour ago"
                cell.img.image = #imageLiteral(resourceName: "profile2")
            case 1:
                
                let stringMain = "Ludwing I love how you took it on white!"
                let stringDefault = "I love how you took it on white!"
                
                let locDefault = stringMain.characters.count-stringDefault.characters.count
                
                let stringAttributed = NSMutableAttributedString.init(string: "Ludwing I love how you took it on white!")
                let font = UIFont(name: "verdana", size: 12)
                
                stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
                cell.Title?.attributedText = stringAttributed
                cell.time.text = "3 hour ago"
                cell.img.image = #imageLiteral(resourceName: "profile3")
            case 2:
                
                let stringMain = "Christina You're awsome!"
                let stringDefault = "You're awsome! "
                
                let locDefault = stringMain.characters.count-stringDefault.characters.count
                
                let stringAttributed = NSMutableAttributedString.init(string: "Christina You're awsome!")
                let font = UIFont(name: "verdana", size: 12)
                
                stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
                cell.Title?.attributedText = stringAttributed
                cell.time.text = "An hour ago"
                cell.img.image = #imageLiteral(resourceName: "profile1")
            case 3:
                
                let stringMain = "Remi Boucher Wow!"
                let stringDefault = "Wow! "
                
                let locDefault = stringMain.characters.count-stringDefault.characters.count
                
                let stringAttributed = NSMutableAttributedString.init(string: "Remi Boucher Wow!")
                let font = UIFont(name: "verdana", size: 12)
                
                stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
                cell.Title?.attributedText = stringAttributed
                cell.time.text = "3 hour ago"
                cell.img.image = #imageLiteral(resourceName: "profile2")
            case 4:
                
                let stringMain = "Tony Ramirez Nice Photo!"
                let stringDefault = "Nice Photo! "
                
                let locDefault = stringMain.characters.count-stringDefault.characters.count
                
                let stringAttributed = NSMutableAttributedString.init(string: "Tony Ramirez Nice Photo!")
                let font = UIFont(name: "verdana", size: 12)
                
                stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
                cell.Title?.attributedText = stringAttributed
                cell.time.text = "3 hour ago"
                cell.img.image = #imageLiteral(resourceName: "profile3")
            default:
                break
            }
            
            return cell
        }
        
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
    
    // TextFieldActivityStyle9Delegate
    func textChange(text: String, tag: NSInteger) {
        print("Result Textfield \(text) ")
    }
    
    func Send() {
        FunctionDefault.AlertMessage(title: "Send", message: "", targetVC: self)
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
