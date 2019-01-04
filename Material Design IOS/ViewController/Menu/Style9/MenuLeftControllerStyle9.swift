//
//  MenuLeftControllerStyle9.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/14/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuLeftControllerStyle9: UIViewController, UITableViewDelegate, UITableViewDataSource, MenuStyle9FooterDelegate {

    private var tableMenu: UITableView = UITableView() // var tableview
    var list = NSArray() // var list for data cell
    var listImage = NSArray() // var list for data cell
    var footer = MenuStyle9Footer() // var view xib in folder menu style3 name MenuStyle3Footer

    override func viewDidLoad() {
        super.viewDidLoad()
        
        listImage = ["iconDashboardWhite", "iconExploreWhite", "iconProfile", "iconMessage", "iconSettingPutih"]
        list = ["Dashboard", "Explore", "Profile", "Message", "Setting"]
        
        createView() // creater create table and regis UINib, create footer
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 44/255.0, green: 57/255.0, blue: 64/255.0, alpha: 1)
        
        // Create Table
        tableMenu.frame = CGRect(x: 0, y: 30, width: self.view.frame.size.width/3.5, height: self.view.frame.size.height-30-70)
        tableMenu.delegate = self;
        tableMenu.dataSource = self;
        tableMenu.backgroundColor = UIColor.clear
        tableMenu.separatorColor = UIColor.clear
        tableMenu.allowsSelection = true
        tableMenu.isScrollEnabled = false
        
        // register UINib for Style8Back
        tableMenu.register(UINib(nibName: "MenuStyle9Cell", bundle: nil), forCellReuseIdentifier: "MenuStyle9Cell")
        
        self.view.addSubview(tableMenu)
        
        // create footer
        footer = Bundle.main.loadNibNamed("MenuStyle9Footer", owner: nil, options: nil)?.first as! MenuStyle9Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-70, width: self.view.frame.size.width/3.5, height: 50)
        footer.delegate = self
        self.view.addSubview(footer)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuStyle9Cell", for: indexPath) as! MenuStyle9Cell
        cell.img.image = UIImage(named: "\(listImage[indexPath.row])")
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuStyle9Cell
        cell.viewIcon.backgroundColor = UIColor.init(red: 53/255.0, green: 145/255.0, blue: 250/255.0, alpha: 1)
        cell.contentView.backgroundColor = UIColor.init(red: 44/255.0, green: 57/255.0, blue: 64/255.0, alpha: 1)
        FunctionDefault.AlertMessageAction(title: list[indexPath.row] as! String, message: "", targetVC: self)

    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuStyle9Cell
        cell.viewIcon.backgroundColor = UIColor.init(red: 44/255.0, green: 57/255.0, blue: 64/255.0, alpha: 1)
        cell.contentView.backgroundColor = UIColor.init(red: 44/255.0, green: 57/255.0, blue: 64/255.0, alpha: 1)
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    
    // MenuStyle9FooterDelegate
    func logout() {
        FunctionDefault.AlertMessageAction(title: "Logout", message: "", targetVC: self)
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
