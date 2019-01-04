//
//  MenuLeftControllerStyle16.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/17/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuLeftControllerStyle16: UIViewController, UITableViewDelegate, UITableViewDataSource, MenuStyle3FooterDelegate, MenuStyle15FooterDelegate {

    private var tableMenu: UITableView = UITableView() // var tableView
    var header = MenuStyle16Header() // var view xib in folder menu style16 name MenuStyle16Header
    var footer = MenuStyle15Footer() // var view xib in folder menu style15 name MenuStyle15Footer
    var list = NSArray() // var list for data cell
    var listNotif = [Int]() // var list for data notif
    var listImage = NSArray() // var list for cell image

    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["Explore", "Messages", "Photos", "Videos", "Group", "Setting"]
        listNotif = [32, 0, 0, 0, 0, 0]
        listImage = ["iconExploreWhite", "iconMessage", "iconPhotos", "iconVideos", "iconGroup", "iconSettingPutih"]

        createView() // creater header, create table and regis UINib
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 44/255.0, green: 57/255.0, blue: 64/255.0, alpha: 1)
        
        // create header
        header = Bundle.main.loadNibNamed("MenuStyle16Header", owner: nil, options: nil)?.first as! MenuStyle16Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 140)
        header.name.text = "Michael Angelo"
        header.city.text = "Manhattan, NY"
        header.valueNotif.text = "2"
        self.view.addSubview(header)
        
        // Create Table
        tableMenu.frame = CGRect(x: 0, y: 150, width: self.view.frame.size.width, height: self.view.frame.size.height-150)
        tableMenu.delegate = self;
        tableMenu.dataSource = self;
        tableMenu.backgroundColor = UIColor.clear
        tableMenu.separatorColor = UIColor.clear
        tableMenu.allowsSelection = true
        tableMenu.isScrollEnabled = true
        
        // register UINib for Style8Back
        tableMenu.register(UINib(nibName: "MenuStyle4Cell", bundle: nil), forCellReuseIdentifier: "MenuStyle4Cell")
        
        self.view.addSubview(tableMenu)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuStyle4Cell", for: indexPath) as! MenuStyle4Cell
        cell.nameCell.text = list[indexPath.row] as? String
        cell.img.image = UIImage(named: "\(listImage[indexPath.row])")

        if listNotif[indexPath.row] > 0 {
            cell.viewValue.isHidden = false
            cell.viewValue.layer.cornerRadius = 5
            cell.viewValue.clipsToBounds = true
            cell.valueNotif.text = String(listNotif[indexPath.row])
        }else{
            cell.viewValue.isHidden = true
        }
        
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuStyle4Cell
        cell.viewValue.backgroundColor = UIColor.init(red: 53/255.0, green: 145/255.0, blue: 250/255.0, alpha: 1)
        cell.contentView.backgroundColor = UIColor.init(red: 33/255.0, green: 48/255.0, blue: 56/255.0, alpha: 1)
        FunctionDefault.AlertMessageAction(title: list[indexPath.row] as! String, message: "", targetVC: self)
        // logic
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuStyle4Cell
        cell.contentView.backgroundColor = UIColor.init(red: 44/255.0, green: 57/255.0, blue: 64/255.0, alpha: 1)
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    
    // MenuStyle15FooterDelegate
    func setting() {
        FunctionDefault.AlertMessageAction(title: "Setting", message: "", targetVC: self)
    }
    
    func profile() {
        FunctionDefault.AlertMessageAction(title: "Profile", message: "", targetVC: self)
    }
    
    func logout() {
        FunctionDefault.AlertMessageAction(title: "Logout", message: "", targetVC: self)
    }
    // end
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent // return for status bar lightcontent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
