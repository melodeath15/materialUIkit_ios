//
//  MenuLeftControllerStyle5.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/13/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuLeftControllerStyle5: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var tableMenu: UITableView = UITableView() // var tableview
    var list = NSArray() // var list for data cell
    var listNotif = [Int]() // var list for data notif
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["Explore", "Timeline", "Photos", "Videos", "Message", "Setting", "Logout"]
        listNotif = [0, 0, 0, 0, 2, 0, 0]

        
        createView() // creater create table and regis UINib
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.white
                
        // Create Table
        let newView = UIView()
        newView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.2, height: self.view.frame.size.height)

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
        
        if listNotif[indexPath.row] > 0 {
            cell.viewNumber.isHidden = false
            cell.valueNumber.text = String(listNotif[indexPath.row])
        }else{
            cell.viewNumber.isHidden = true
        }
        
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuStyle5Cell
        cell.nameCell.textColor = UIColor.black
        cell.viewNumber.backgroundColor = UIColor.init(red: 53/255.0, green: 145/255.0, blue: 250/255.0, alpha: 1)
        cell.contentView.backgroundColor = UIColor.white
        FunctionDefault.AlertMessageAction(title: list[indexPath.row] as! String, message: "", targetVC: self)
        // logic
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuStyle5Cell
        cell.nameCell.textColor = UIColor.darkGray
        cell.contentView.backgroundColor = UIColor.white
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
