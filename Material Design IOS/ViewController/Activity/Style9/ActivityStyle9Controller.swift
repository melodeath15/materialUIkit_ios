//
//  ActivityStyle9Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ActivityStyle9Controller: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewActivityStyle1HeaderDelegate, ViewActivityStyle9ImageDelegate, TextFieldActivityStyle9Delegate {
    
    private var tableStyle: UITableView = UITableView() // var tableView
    var header = ViewActivityStyle1Header() // var view xib in folder style1 name ViewActivityStyle1Header
    var footer = TextFieldActivityStyle9() // var view xib in folder style9 name TextFieldActivityStyle9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // function for create header, create table and regis UINib, create footer
    }
    
    func createView(){
        
        // Create Header
        header = Bundle.main.loadNibNamed("ViewActivityStyle1Header", owner: nil, options: nil)?.first as! ViewActivityStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.iconBack.setImage(UIImage(named: "menu1"), for: .normal)
        header.btnWrite.isHidden = true
        
        // function show or close menu left
        header.iconBack.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        self.view.addSubview(header)
        
        // Create Table
        tableStyle.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80-50)
        tableStyle.delegate = self;
        tableStyle.dataSource = self;
        tableStyle.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        tableStyle.separatorColor = UIColor.clear
        tableStyle.allowsSelection = false
        
        // register UINib for ViewActivityStyle9Image, ViewActivityStyle9TextAll
        tableStyle.register(UINib(nibName: "ViewActivityStyle9Image", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle9Image")
        tableStyle.register(UINib(nibName: "ViewActivityStyle9TextAll", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle9TextAll")
        self.view .addSubview(tableStyle)
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("TextFieldActivityStyle9", owner: nil, options: nil)?.first as! TextFieldActivityStyle9
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width, height: 50)
        footer.delegate = self
        self.view.addSubview(footer)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 250
        }else{
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle9Image", for: indexPath) as! ViewActivityStyle9Image
            
            cell.profileImg.image = #imageLiteral(resourceName: "profile1")
            cell.name.text = "Gabriella Madelaine"
            cell.time.text = "An hour ago"
            
            cell.imgPoster.image = #imageLiteral(resourceName: "As4")
            cell.valueLove.text = "1347"
            
            cell.indxPath = indexPath
            cell.backgroundColor = UIColor.clear
            cell.delegate = self
            return cell
        case 1 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle9TextAll", for: indexPath) as! ViewActivityStyle9TextAll
            
            let stringMain = "Tony Ramirez Nice photo!"
            let stringDefault = "Nice photo! "
            
            let locDefault = stringMain.characters.count-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Tony Ramirez Nice photo!")
            let font = UIFont(name: "verdana", size: 12)
            
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            cell.Title?.attributedText = stringAttributed
            
            cell.img.image = #imageLiteral(resourceName: "profile1")
            cell.time.text = "An hour ago"
            
            cell.backgroundColor = UIColor.init(red: 240/255.0, green: 243/255.0, blue: 246/255.0, alpha: 1.0)
            return cell
        case 2 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle9TextAll", for: indexPath) as! ViewActivityStyle9TextAll
            
            let stringMain = "Ludwig I love you took it on white!"
            let stringDefault = "I love you took it on white! "
            
            let locDefault = stringMain.characters.count-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Ludwig I love you took it on white!")
            let font = UIFont(name: "verdana", size: 12)
            
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            cell.Title?.attributedText = stringAttributed
            
            cell.img.image = #imageLiteral(resourceName: "profile1")
            cell.time.text = "3 hour ago"
            
            cell.backgroundColor = UIColor.init(red: 240/255.0, green: 243/255.0, blue: 246/255.0, alpha: 1.0)
            return cell
        case 3 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle9TextAll", for: indexPath) as! ViewActivityStyle9TextAll
            
            let stringMain = "Christina You're awesome!"
            let stringDefault = "You're awesome! "
            
            let locDefault = stringMain.characters.count-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Christina You're awesome!")
            let font = UIFont(name: "verdana", size: 12)
            
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            cell.Title?.attributedText = stringAttributed
            
            cell.img.image = #imageLiteral(resourceName: "profile1")
            cell.time.text = "4 hour ago"
            
            cell.backgroundColor = UIColor.init(red: 240/255.0, green: 243/255.0, blue: 246/255.0, alpha: 1.0)
            return cell
        case 4 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle9TextAll", for: indexPath) as! ViewActivityStyle9TextAll
            
            let stringMain = "Remi Boucher Wow!"
            let stringDefault = "Wow! "
            
            let locDefault = stringMain.characters.count-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Remi Boucher Wow!")
            let font = UIFont(name: "verdana", size: 12)
            
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            cell.Title?.attributedText = stringAttributed
            
            cell.img.image = #imageLiteral(resourceName: "profile1")
            cell.time.text = "4 hour ago"
            
            cell.backgroundColor = UIColor.init(red: 240/255.0, green: 243/255.0, blue: 246/255.0, alpha: 1.0)
            return cell
        default:
            break
        }
        
        let cell = UITableViewCell() // cell nil
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
    
    // ViewActivityStyle9ImageDelegate
    func Like(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "Like Index", message: String(index.row), targetVC: self)
    }
    // end
    
    // TextFieldActivityStyle9Delegate
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
