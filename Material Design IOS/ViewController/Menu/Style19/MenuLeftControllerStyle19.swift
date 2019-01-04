//
//  MenuLeftControllerStyle19.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/17/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuLeftControllerStyle19: UIViewController, UITableViewDelegate, UITableViewDataSource, MenuStyle15FooterDelegate {

    private var tableMenu: UITableView = UITableView() // var tableview
    var viewProfile = MenuStyle14Profile() // var view xib in folder menu style14 name MenuStyle14Profile
    var footer = MenuStyle15Footer() // var view xib in folder menu style15 name MenuStyle15Footer
    var list = NSArray() // var list for data cell
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["Feed", "Explore", "Photos", "Videos", "Messages"]
        
        createView() // creater create table and regis UINib, create profile, create footer
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create Profile
        viewProfile = Bundle.main.loadNibNamed("MenuStyle14Profile", owner: nil, options: nil)?.first as! MenuStyle14Profile
        viewProfile.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.2, height: 80)
        viewProfile.name.text = "James Richardson"
        viewProfile.city.text = "Manhattan, NY"
        self.view.addSubview(viewProfile)
        
        // Create Table
        let newView = UIView()
        newView.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width/1.2, height: self.view.frame.size.height-80-70)
        
        let cellHeight = list.count * 50
        
        tableMenu.frame = CGRect(x: 0, y: 0, width: Int(self.view.frame.size.width/1.2), height: cellHeight)
        tableMenu.center = newView.center
        tableMenu.delegate = self;
        tableMenu.dataSource = self;
        tableMenu.backgroundColor = UIColor.clear
        tableMenu.separatorColor = UIColor.clear
        tableMenu.allowsSelection = true
        tableMenu.isScrollEnabled = false
        
        // register UINib for Style8Back
        tableMenu.register(UINib(nibName: "MenuStyle5Cell", bundle: nil), forCellReuseIdentifier: "MenuStyle5Cell")
        
        self.view.addSubview(tableMenu)
        
        // create footer
        footer = Bundle.main.loadNibNamed("MenuStyle15Footer", owner: nil, options: nil)?.first as! MenuStyle15Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-70, width: self.view.frame.size.width/1.2, height: 50)
        footer.btnSetting.setImage(UIImage(named:"iconSettingBlack"), for: .normal)
        footer.delegate = self
        self.view.addSubview(footer)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuStyle5Cell", for: indexPath) as! MenuStyle5Cell
        cell.nameCell.text = list[indexPath.row] as? String
        cell.backgroundColor = UIColor.clear
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuStyle5Cell
        cell.nameCell.textColor = UIColor.black
        cell.contentView.backgroundColor = UIColor.init(red: 238/255.0, green: 241/255.0, blue: 244/255.0, alpha: 1)
        FunctionDefault.AlertMessageAction(title: list[indexPath.row] as! String, message: "", targetVC: self)
        // logic
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuStyle5Cell
        cell.nameCell.textColor = UIColor.darkGray
        cell.contentView.backgroundColor =  UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
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

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
