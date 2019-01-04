//
//  MenuLeftControllerStyle14.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/17/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuLeftControllerStyle14: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    private var tableMenu: UITableView = UITableView() // var tableview
    var viewProfile = MenuStyle14Profile() // var view xib in folder menu style12 name MenuStyle12Footer
    var header = MenuStyle14Header() // var view xib in folder menu style12 name MenuStyle12Footer
    var list = NSArray() // var list for data cell
    var listNotif = [Int]() // var list for data notif
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["Feed", "Explore", "Activity", "Group", "Setting"]
        listNotif = [32, 0, 0, 0, 0]
        
        createView() // creater searchbar, create table and regis UINib, create profile, create header
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create Profile
        viewProfile = Bundle.main.loadNibNamed("MenuStyle14Profile", owner: nil, options: nil)?.first as! MenuStyle14Profile
        viewProfile.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.2, height: 80)
        viewProfile.name.text = "Michael Hendley"
        viewProfile.city.text = "Manhattan, NY"
        self.view.addSubview(viewProfile)
        
        // create Header
        header = Bundle.main.loadNibNamed("MenuStyle14Header", owner: nil, options: nil)?.first as! MenuStyle14Header
        header.frame = CGRect(x: 0, y: 90, width: self.view.frame.size.width/1.2, height: 100)
        self.view.addSubview(header)
        
        // Create Table
        tableMenu.frame = CGRect(x: 0, y: 190, width: self.view.frame.size.width/1.2, height: self.view.frame.size.height-190)
        tableMenu.delegate = self;
        tableMenu.dataSource = self;
        tableMenu.backgroundColor = UIColor.clear
        tableMenu.separatorColor = UIColor.clear
        tableMenu.allowsSelection = true
        tableMenu.isScrollEnabled = false
        
        // register UINib for Style8Back
        tableMenu.register(UINib(nibName: "MenuStyle8Cell", bundle: nil), forCellReuseIdentifier: "MenuStyle8Cell")
        
        self.view.addSubview(tableMenu)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuStyle8Cell", for: indexPath) as! MenuStyle8Cell
        cell.nameCell.text = list[indexPath.row] as? String
        
        if listNotif[indexPath.row] > 0 {
            cell.viewValue.isHidden = false
            cell.value.text = String(listNotif[indexPath.row])
            cell.viewValue.layer.cornerRadius = 5
            cell.viewValue.clipsToBounds = true
        }else{
            cell.viewValue.isHidden = true
        }
        
        cell.backgroundColor = UIColor.clear
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuStyle8Cell
        cell.nameCell.textColor = UIColor.black
        cell.viewValue.backgroundColor = UIColor.init(red: 53/255.0, green: 145/255.0, blue: 250/255.0, alpha: 1)
        cell.contentView.backgroundColor = UIColor.init(red: 238/255.0, green: 241/255.0, blue: 244/255.0, alpha: 1)
        FunctionDefault.AlertMessageAction(title: list[indexPath.row] as! String, message: "", targetVC: self)
        // logic
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuStyle8Cell
        cell.nameCell.textColor = UIColor.darkGray
        cell.contentView.backgroundColor =  UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
