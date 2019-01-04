//
//  MenuLeftControllerStyle3.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/12/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuLeftControllerStyle3: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, MenuStyle3FooterDelegate {
    
    private var tableMenu: UITableView = UITableView() // var tableview
    var viewSearchBar = UISearchBar() // var searchBar
    var footer = MenuStyle3Footer() // var view xib in folder menu style3 name MenuStyle3Footer
    var list = NSArray() // var list for data cell
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["Explore", "Timeline", "Photos", "Videos", "Messages"]
        
        createView() // creater searchbar, footer, create table and regis UINib
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 153/255.0, green: 42/255.0, blue: 179/255.0, alpha: 1)
        
        // create searchbar
        viewSearchBar.frame = CGRect(x: 0, y: 25, width: self.view.frame.size.width/1.2, height: 50)
        viewSearchBar.placeholder = "Search"
        viewSearchBar.barTintColor = UIColor.init(red: 153/255.0, green: 42/255.0, blue: 179/255.0, alpha: 1)
        viewSearchBar.showsCancelButton = true
        
        viewSearchBar.layer.borderWidth = 0.5
        viewSearchBar.layer.borderColor = UIColor.init(red: 153/255.0, green: 42/255.0, blue: 179/255.0, alpha: 1) .cgColor
        viewSearchBar.clipsToBounds = true
        
        viewSearchBar.delegate = self
        self.view.addSubview(viewSearchBar)
        
        // Create Table
        let newView = UIView()
        newView.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width/1.2, height: self.view.frame.size.height-80-50)

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
        tableMenu.register(UINib(nibName: "MenuStyle3Cell", bundle: nil), forCellReuseIdentifier: "MenuStyle3Cell")
        
        self.view.addSubview(tableMenu)
        
        // create footer
        footer = Bundle.main.loadNibNamed("MenuStyle3Footer", owner: nil, options: nil)?.first as! MenuStyle3Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width/1.2, height: 50)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuStyle3Cell", for: indexPath) as! MenuStyle3Cell
        cell.nameCell.text = list[indexPath.row] as? String
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        FunctionDefault.AlertMessageAction(title: list[indexPath.row] as! String, message: "", targetVC: self)
        // logic
    }
    
    // Delegate UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // logic
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        // logic
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // logic
    }
    
    // MenuStyle3FooterDelegate
    func logout() {
        FunctionDefault.AlertMessageAction(title: "Logout", message: "", targetVC: self)
    }
    
    func setting() {
        FunctionDefault.AlertMessageAction(title: "Setting", message: "", targetVC: self)
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
