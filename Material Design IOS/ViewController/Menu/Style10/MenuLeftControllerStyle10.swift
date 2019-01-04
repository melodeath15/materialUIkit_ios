//
//  MenuLeftControllerStyle10.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/14/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuLeftControllerStyle10: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var tableMenu: UITableView = UITableView() // var tableview
    var header = MenuStyle10Header() // var view xib in folder menu style6 name MenuStyle6Header
    var list = NSArray() // var list for data cell
    var listNotif = [Int]() // var list for data notif
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["Feed", "Explore", "Activity", "Group", "Photos", "Videos", "Setting"]
        listNotif = [32, 0, 0, 0, 0, 0, 0]
        
        createView() // creater create table and regis UINib, create header
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 44/255.0, green: 57/255.0, blue: 64/255.0, alpha: 1)
        
        // create header
        header = Bundle.main.loadNibNamed("MenuStyle10Header", owner: nil, options: nil)?.first as! MenuStyle10Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.2, height: 180)
        header.name.text = "Michael Angelo"
        header.city.text = "Manhattan, NY"
        self.view.addSubview(header)
        
        // Create Table
        tableMenu.frame = CGRect(x: 0, y: 180, width: self.view.frame.size.width/1.2, height: self.view.frame.size.height-180)
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
        cell.nameCell.textColor = UIColor.white
        
        if listNotif[indexPath.row] > 0 {
            cell.viewValue.isHidden = false
            cell.viewValue.backgroundColor = UIColor.init(red: 33/255.0, green: 48/255.0, blue: 56/255.0, alpha: 1)
            cell.viewValue.layer.cornerRadius = 5
            cell.viewValue.clipsToBounds = true
            cell.value.text = String(listNotif[indexPath.row])
        }else{
            cell.viewValue.isHidden = true
        }
        
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuStyle8Cell
        cell.viewValue.backgroundColor = UIColor.init(red: 33/255.0, green: 48/255.0, blue: 56/255.0, alpha: 1)
        cell.contentView.backgroundColor = UIColor.init(red: 53/255.0, green: 145/255.0, blue: 250/255.0, alpha: 1)
        
        FunctionDefault.AlertMessageAction(title: list[indexPath.row] as! String, message: "", targetVC: self)
        // logic
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuStyle8Cell
        cell.contentView.backgroundColor = UIColor.init(red: 44/255.0, green: 57/255.0, blue: 64/255.0, alpha: 1)
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    
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
