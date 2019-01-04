//
//  MenuLeftControllerStyle12.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/14/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuLeftControllerStyle12: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, MenuStyle12FooterDelegate {

    private var tableMenu: UITableView = UITableView() // var tableview
    var viewSearchBar = UISearchBar() // var searchBar
    var header = MenuStyle12Profile() // var view xib in folder menu style12 name MenuStyle12Footer
    var footer = MenuStyle12Footer() // var view xib in folder menu style12 name MenuStyle12Footer
    var list = NSArray() // var list for data cell
    var listNotif = [Int]() // var list for data notif

    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["Feed", "Explore", "Activity", "Group", "Setting"]
        listNotif = [32, 0, 0, 0, 0]

        createView() // creater searchbar, create table and regis UINib, create header, create footer
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
        
        // create header
        header = Bundle.main.loadNibNamed("MenuStyle12Profile", owner: nil, options: nil)?.first as! MenuStyle12Profile
        header.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width/1.2, height: 80)
        header.valueNotif.text = "2"
        self.view.addSubview(header)
        
        // Create Table
        tableMenu.frame = CGRect(x: 0, y: 180, width: self.view.frame.size.width/1.2, height: self.view.frame.size.height-180-50)
        tableMenu.delegate = self;
        tableMenu.dataSource = self;
        tableMenu.backgroundColor = UIColor.clear
        tableMenu.separatorColor = UIColor.clear
        tableMenu.allowsSelection = true
        tableMenu.isScrollEnabled = false
        
        // register UINib for Style8Back
        tableMenu.register(UINib(nibName: "MenuStyle8Cell", bundle: nil), forCellReuseIdentifier: "MenuStyle8Cell")
        
        self.view.addSubview(tableMenu)
        
        // create footer
        footer = Bundle.main.loadNibNamed("MenuStyle12Footer", owner: nil, options: nil)?.first as! MenuStyle12Footer
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
    
    // Delegate UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // logic
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        // logic
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // logic
    }
    // end
    
    
    //MenuStyle12FooterDelegate
    func logout() {
        FunctionDefault.AlertMessageAction(title: "Logout", message: "", targetVC: self)
    }
    //end
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
