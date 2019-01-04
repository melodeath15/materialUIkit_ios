//
//  MenuLeftControllerStyle8.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/13/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuLeftControllerStyle8: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    private var tableMenu: UITableView = UITableView() // var tableview
    var viewSearchBar = UISearchBar() // var searchBar
    var list = NSArray() // var list for data cell
    var listNotif = [Int]() // var list for data notif

    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["Feed", "Explore", "Activity", "Group", "Photos", "Videos", "Setting"]
        listNotif = [0, 2, 0, 0, 0, 0, 0]

        createView() // creater searchbar, create table and regis UINib
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create searchbar
        viewSearchBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.2, height: 50)
        viewSearchBar.placeholder = "Search"
        viewSearchBar.barTintColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        viewSearchBar.showsCancelButton = true
        
        viewSearchBar.layer.borderWidth = 0.5
        viewSearchBar.layer.borderColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1) .cgColor
        viewSearchBar.clipsToBounds = true
        
        viewSearchBar.delegate = self
        self.view.addSubview(viewSearchBar)
        
        // Create Table
        let newView = UIView()
        newView.frame = CGRect(x: 0, y: 50, width: self.view.frame.size.width/1.2, height: self.view.frame.size.height-150)
        
        let cellHeight = list.count * 50

        tableMenu.frame = CGRect(x: 0, y: 0, width: Int(self.view.frame.size.width/1.2), height: cellHeight)
        tableMenu.center = newView.center
        tableMenu.delegate = self;
        tableMenu.dataSource = self;
        tableMenu.backgroundColor = UIColor.clear
        tableMenu.separatorColor = UIColor.clear
        tableMenu.allowsSelection = true
        tableMenu.isScrollEnabled = true
        
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
            cell.viewValue.layer.cornerRadius = cell.viewValue.frame.size.width/2
            cell.viewValue.clipsToBounds = true
        }else{
            cell.viewValue.isHidden = true
        }
        
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuStyle8Cell
        cell.nameCell.textColor = UIColor.init(red: 53/255.0, green: 145/255.0, blue: 250/255.0, alpha: 1)
        cell.viewValue.backgroundColor = UIColor.init(red: 53/255.0, green: 145/255.0, blue: 250/255.0, alpha: 1)
        cell.view2.backgroundColor = UIColor.init(red: 53/255.0, green: 145/255.0, blue: 250/255.0, alpha: 1)
        cell.contentView.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        FunctionDefault.AlertMessageAction(title: list[indexPath.row] as! String, message: "", targetVC: self)
        // logic
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuStyle8Cell
        cell.nameCell.textColor = UIColor.darkGray
        cell.view2.backgroundColor = UIColor.clear
        cell.contentView.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    
    // Delegate UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // logic
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // logic
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // logic
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
