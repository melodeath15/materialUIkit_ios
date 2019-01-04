//
//  ActivityStyle5Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/5/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ActivityStyle5Controller: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, ViewActivityStyle1HeaderDelegate {
    
    private var tableStyle: UITableView = UITableView() // var tableView
    var collMenu: UICollectionView! // var collectionview
    var header = ViewActivityStyle1Header() // var view xib in folder style1 name ViewActivityStyle1Header
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // function for create header, create table and regis UINib
        createCollection() // function for create collectionview
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
        tableStyle.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        tableStyle.delegate = self;
        tableStyle.dataSource = self;
        tableStyle.backgroundColor = UIColor.clear
        tableStyle.separatorColor = UIColor.clear
        tableStyle.allowsSelection = false
        
        // regis UINib for header tableviewcell
        tableStyle.register(UINib(nibName: "ViewActivityStyle2HeaderTable", bundle: nil), forHeaderFooterViewReuseIdentifier: "ViewActivityStyle2HeaderTable")
        
        // register UINib for ViewActivityStyle5Text, ViewActivityStyle5Image
        tableStyle.register(UINib(nibName: "ViewActivityStyle5Text", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle5Text")
        tableStyle.register(UINib(nibName: "ViewActivityStyle5Image", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle5Image")
        
        self.view .addSubview(tableStyle)
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headercell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ViewActivityStyle2HeaderTable") as! ViewActivityStyle2HeaderTable
        
        switch section {
        case 0:
            headercell.title.text = "16 June 2016"
        default:
            break
        }
        
        return headercell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return 120
        }else{
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle5Text", for: indexPath) as! ViewActivityStyle5Text
            
            let stringMain = "Gabriella Madelaine liked How to be A Hispter"
            let stringColor = "How to be A Hispter "
            let stringDefault = "liked "
            
            let locColor = stringMain.characters.count-stringColor.characters.count
            let locDefault = locColor-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Gabriella Madelaine liked How to be A Hispter")
            let font = UIFont(name: "verdana", size: 12)

            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            stringAttributed.addAttribute(NSForegroundColorAttributeName, value: UIColor.init(red: 103/255.0, green: 147/255.0, blue: 211/255.0, alpha: 1.0), range: NSRange.init(location: locColor, length: stringColor.characters.count))
            
            cell.Title?.attributedText = stringAttributed
            
            cell.img.image = #imageLiteral(resourceName: "profile1")
            cell.time.text = "An hour ago"
            
            cell.backgroundColor = UIColor.init(red: 240/255.0, green: 243/255.0, blue: 246/255.0, alpha: 1.0)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle5Text", for: indexPath) as! ViewActivityStyle5Text
            
            let stringMain = "Gabriella Madelaine Commented on How to be A Hispter"
            let stringColor = "How to be A Hispter "
            let stringDefault = "Commented on "
            
            let locColor = stringMain.characters.count-stringColor.characters.count
            let locDefault = locColor-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Gabriella Madelaine Commented on How to be A Hispter")
            let font = UIFont(name: "verdana", size: 12)
            
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            stringAttributed.addAttribute(NSForegroundColorAttributeName, value: UIColor.init(red: 103/255.0, green: 147/255.0, blue: 211/255.0, alpha: 1.0), range: NSRange.init(location: locColor, length: stringColor.characters.count))
            
            cell.Title?.attributedText = stringAttributed
            
            cell.img.image = #imageLiteral(resourceName: "profile1")
            cell.time.text = "An hour ago"
            
            cell.backgroundColor = UIColor.init(red: 240/255.0, green: 243/255.0, blue: 246/255.0, alpha: 1.0)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle5Text", for: indexPath) as! ViewActivityStyle5Text
            
            let stringMain = "Gabriella Madelaine is now following you"
            let stringDefault = "is now following you "
    
            let locDefault = stringMain.characters.count-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Gabriella Madelaine is now following you")
            let font = UIFont(name: "verdana", size: 12)
            
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            
            cell.Title?.attributedText = stringAttributed
            
            cell.img.image = #imageLiteral(resourceName: "profile1")
            cell.time.text = "An hour ago"
            
            cell.backgroundColor = UIColor.init(red: 240/255.0, green: 243/255.0, blue: 246/255.0, alpha: 1.0)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle5Image", for: indexPath) as! ViewActivityStyle5Image
            
            let stringMain = "Tony Ramirez added 3 new friends"
            let stringDefault = "added 3 new friends "
            
            let locDefault = stringMain.characters.count-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Tony Ramirez added 3 new friends")
            let font = UIFont(name: "verdana", size: 12)
            
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            
            cell.Title?.attributedText = stringAttributed
            
            cell.viewColl.addSubview(collMenu)
            
            cell.img.image = #imageLiteral(resourceName: "profile2")
            cell.time.text = "An hour ago"
            
            cell.backgroundColor = UIColor.init(red: 240/255.0, green: 243/255.0, blue: 246/255.0, alpha: 1.0)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle5Text", for: indexPath) as! ViewActivityStyle5Text
            
            let stringMain = "Tony Ramirez liked Introduction to UX design"
            let stringColor = "Introduction to UX design "
            let stringDefault = "liked "
            
            let locColor = stringMain.characters.count-stringColor.characters.count
            let locDefault = locColor-stringDefault.characters.count
            
            let stringAttributed = NSMutableAttributedString.init(string: "Tony Ramirez liked Introduction to UX design")
            let font = UIFont(name: "verdana", size: 12)
            
            stringAttributed.addAttribute(NSFontAttributeName, value:font!, range: NSRange.init(location: locDefault, length: stringDefault.characters.count))
            stringAttributed.addAttribute(NSForegroundColorAttributeName, value: UIColor.init(red: 255/255.0, green: 204/255.0, blue: 102/255.0, alpha: 1.0), range: NSRange.init(location: locColor, length: stringColor.characters.count))
            
            cell.Title?.attributedText = stringAttributed
            
            cell.img.image = #imageLiteral(resourceName: "profile2")
            cell.time.text = "An hour ago"
            
            cell.backgroundColor = UIColor.init(red: 240/255.0, green: 243/255.0, blue: 246/255.0, alpha: 1.0)
            return cell
        default:
            break
        }
        
        let cell = UITableViewCell() // cell nil
        return cell
    }
    
    func createCollection() { // function create collectionview
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height:50)
        layout.scrollDirection = .horizontal
        
        collMenu = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width-60, height: 60), collectionViewLayout: layout)
        collMenu.backgroundColor = UIColor.clear
        collMenu.delegate = self;
        collMenu.dataSource = self;
        
        // regis UINib ViewActivityStyle1NewFriendsCell
        collMenu.register(UINib(nibName: "ViewActivityStyle1NewFriendsCell", bundle:nil), forCellWithReuseIdentifier: "ViewActivityStyle1NewFriendsCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ViewActivityStyle1NewFriendsCell", for: indexPath) as! ViewActivityStyle1NewFriendsCell
        
        switch indexPath.row {
        case 0:
            cell.imgCell.image = #imageLiteral(resourceName: "profile1")
        case 1:
            cell.imgCell.image = #imageLiteral(resourceName: "profile2")
        case 2:
            cell.imgCell.image = #imageLiteral(resourceName: "profile3")
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
