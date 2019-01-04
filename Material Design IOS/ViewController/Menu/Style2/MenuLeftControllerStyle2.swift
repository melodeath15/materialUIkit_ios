//
//  MenuLeftControllerStyle2.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/12/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuLeftControllerStyle2: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    private var tableMenu: UITableView = UITableView() // var tableview
    var viewSearchBar = UISearchBar() // var searchBar
    var list = NSArray() // var list for data cell
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["Profile", "Notification", "Setting", "Feed", "Photo", "Video", "Logout"]
        
        createView() // creater searchbar, create table and regis UINib
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create searchbar
        viewSearchBar.frame = CGRect(x: 0, y: 25, width: self.view.frame.size.width/1.2, height: 50)
        viewSearchBar.placeholder = "Search"
        viewSearchBar.barTintColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        viewSearchBar.showsCancelButton = true
        
        viewSearchBar.layer.borderWidth = 0.5
        viewSearchBar.layer.borderColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1) .cgColor
        viewSearchBar.clipsToBounds = true
        
        viewSearchBar.delegate = self
        self.view.addSubview(viewSearchBar)
        
        // Create Table
        tableMenu.frame = CGRect(x: 0, y: 90, width: self.view.frame.size.width/1.2, height: self.view.frame.size.height-90)
        tableMenu.delegate = self;
        tableMenu.dataSource = self;
        tableMenu.backgroundColor = UIColor.clear
        tableMenu.separatorColor = UIColor.clear
        tableMenu.allowsSelection = true
        tableMenu.isScrollEnabled = false
        
        // register UINib for Style8Back
        tableMenu.register(UINib(nibName: "MenuStyle2Cell", bundle: nil), forCellReuseIdentifier: "MenuStyle2Cell")
    
        self.view.addSubview(tableMenu)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuStyle2Cell", for: indexPath) as! MenuStyle2Cell
        cell.nameCell.text = list[indexPath.row] as? String
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuStyle2Cell
        cell.nameCell.textColor = UIColor.black
        cell.contentView.backgroundColor = UIColor.white
        
        FunctionDefault.AlertMessageAction(title: list[indexPath.row] as! String, message: "", targetVC: self)
        // logic
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuStyle2Cell
        cell.nameCell.textColor = UIColor.darkGray
        cell.contentView.backgroundColor =  UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
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
    // end
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
