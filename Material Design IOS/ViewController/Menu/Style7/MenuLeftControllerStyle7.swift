//
//  MenuLeftControllerStyle7.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/13/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuLeftControllerStyle7: UIViewController, UITableViewDelegate, UITableViewDataSource, MenuSyle6HeaderCellDelegate, UISearchBarDelegate {
    
    private var tableMenu: UITableView = UITableView() // var tableview
    var viewSearchBar = UISearchBar() // var searchBar
    var header = MenuStyle6Header() // var view xib in folder menu style6 name MenuStyle6Header
    var footer = MenuStyle3Footer() // var view xib in folder menu style3 name MenuStyle3Footer
    
    // var section for menu
    var sections = [
        Section(title: "Feed",
                subTitle: ["Popular1", "Recent1", "Favorite1"],
                expanded: false),
        Section(title: "Explore",
                subTitle: ["Popular2", "Recent2", "Favorite2"],
                expanded: false),
        Section(title: "Activity",
                subTitle: ["Popular3", "Recent3", "Favorite3"],
                expanded: false),
        Section(title: "Group",
                subTitle: ["Popular4", "Recent4", "Favorite4"],
                expanded: false),
        Section(title: "Setting",
                subTitle: ["Popular5", "Recent5", "Favorite5"],
                expanded: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // creater searchbar, create table and regis UINib
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create searchbar
        viewSearchBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50)
        viewSearchBar.placeholder = "Search"
        viewSearchBar.barTintColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        viewSearchBar.showsCancelButton = true
        
        viewSearchBar.layer.borderWidth = 0.5
        viewSearchBar.layer.borderColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1) .cgColor
        viewSearchBar.clipsToBounds = true
        
        viewSearchBar.delegate = self
        self.view.addSubview(viewSearchBar)
        
        // Create Table
        tableMenu.frame = CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: self.view.frame.size.height-150)
        tableMenu.delegate = self;
        tableMenu.dataSource = self;
        tableMenu.backgroundColor = UIColor.clear
        tableMenu.separatorColor = UIColor.clear
        tableMenu.allowsSelection = true
        tableMenu.isScrollEnabled = true
        
        // register UINib for Style8Back
        tableMenu.register(UINib(nibName: "MenuSyle6HeaderCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "MenuSyle6HeaderCell")
        tableMenu.register(UINib(nibName: "MenuStyle6Cell", bundle: nil), forCellReuseIdentifier: "MenuStyle6Cell")
        
        self.view.addSubview(tableMenu)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].subTitle.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sections[indexPath.section].expanded {
            return 50
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MenuSyle6HeaderCell") as! MenuSyle6HeaderCell
        headerCell.nameHeader.text = sections[section].title
        headerCell.nameHeader.textColor = UIColor.darkGray
        headerCell.delegate = self
        headerCell.section = section
        headerCell.btnNext.isHidden = false
        headerCell.btnNext.isUserInteractionEnabled = false
        headerCell.contentView.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuStyle6Cell", for: indexPath) as! MenuStyle6Cell
        cell.nameCell.text = sections[indexPath.section].subTitle[indexPath.row]
        cell.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        FunctionDefault.AlertMessageAction(title: sections[indexPath.section].subTitle[indexPath.row], message: "", targetVC: self)
        // logic
    }
    
    // Delegate MenuSyle6HeaderCellDelegate
    func toggleSection(header: MenuSyle6HeaderCell, section: Int) {
        
        sections[section].expanded = !sections[section].expanded
        
        if sections[section].expanded{
            tableMenu.beginUpdates()
            for i in 0 ..< sections[section].subTitle.count {
                tableMenu.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
                header.btnNext.setImage(UIImage(named: "dropdownIcon"), for: .normal)
            }
            tableMenu.endUpdates()
        }else{
            tableMenu.beginUpdates()
            for i in 0 ..< sections[section].subTitle.count {
                tableMenu.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
                header.btnNext.setImage(UIImage(named: "nextIcon"), for: .normal)
            }
            tableMenu.endUpdates()
        }
        

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
