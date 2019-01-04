//
//  MenuLeftControllerStyle4.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/12/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuLeftControllerStyle4: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    private var tableMenu: UITableView = UITableView() // var tableView
    var list = NSArray() // var list for data cell
    var listImage = NSArray() // var list for cell image
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["Profile", "Messages", "Settings", "Group", "Photos", "Videos", "Logout"]
        listImage = ["iconProfile", "iconMessage", "iconSettingPutih", "iconGroup", "iconPhotos", "iconVideos", "iconLogout"]
        
        createView() // creater create table and regis UINib
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 44/255.0, green: 57/255.0, blue: 64/255.0, alpha: 1)
        
        // Create Table
        let newView = UIView()
        newView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        
        let cellHeight = list.count * 50
        
        tableMenu.frame = CGRect(x: 0, y: 0, width: Int(self.view.frame.size.width), height: cellHeight)
        tableMenu.center = newView.center
        tableMenu.delegate = self;
        tableMenu.dataSource = self;
        tableMenu.backgroundColor = UIColor.clear
        tableMenu.separatorColor = UIColor.clear
        tableMenu.allowsSelection = true
        tableMenu.isScrollEnabled = false
        
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
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuStyle4Cell
        cell.contentView.backgroundColor = UIColor.init(red: 33/255.0, green: 48/255.0, blue: 56/255.0, alpha: 1)
        FunctionDefault.AlertMessageAction(title: list[indexPath.row] as! String, message: "", targetVC: self)
        // logic
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuStyle4Cell
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
