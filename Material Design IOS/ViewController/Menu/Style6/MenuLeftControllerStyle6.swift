//
//  MenuLeftControllerStyle6.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/13/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuLeftControllerStyle6: UIViewController, UITableViewDelegate, UITableViewDataSource, MenuSyle6HeaderCellDelegate, MenuStyle3FooterDelegate {

    private var tableMenu: UITableView = UITableView() // var tableview
    var header = MenuStyle6Header() // var view xib in folder menu style6 name MenuStyle6Header
    var footer = MenuStyle3Footer() // var view xib in folder menu style3 name MenuStyle3Footer

    // var section for menu
    var sections = [
        Section(title: "Stories",
                subTitle: ["Popular", "Recent", "Favorite"],
                expanded: false),
        Section(title: "Feed",
                subTitle: [],
                expanded: false),
        Section(title: "Messages",
                subTitle: [],
                expanded: false),
        Section(title: "Profile",
                subTitle: [],
                expanded: false)
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createView() // creater create table and regis UINib. create header, create footer
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 153/255.0, green: 42/255.0, blue: 179/255.0, alpha: 1)
        
        // Create Header
        header = Bundle.main.loadNibNamed("MenuStyle6Header", owner: nil, options: nil)?.first as! MenuStyle6Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.2, height: 200)
        header.name.text = "Michael Angelo"
        header.city.text = "Manhattan, NY"
        self.view.addSubview(header)
        
        // Create Table
        tableMenu.frame = CGRect(x: 0, y: 200, width: self.view.frame.size.width/1.2, height: self.view.frame.size.height-200-50)
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
        
        // create footer
        footer = Bundle.main.loadNibNamed("MenuStyle3Footer", owner: nil, options: nil)?.first as! MenuStyle3Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width/1.2, height: 50)
        footer.delegate = self
        self.view.addSubview(footer)
        
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
        let headercell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MenuSyle6HeaderCell") as! MenuSyle6HeaderCell
        headercell.nameHeader.text = sections[section].title
        headercell.delegate = self
        headercell.section = section
        headercell.contentView.backgroundColor = UIColor.init(red: 153/255.0, green: 42/255.0, blue: 179/255.0, alpha: 1)
        return headercell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuStyle6Cell", for: indexPath) as! MenuStyle6Cell
        cell.nameCell.text = sections[indexPath.section].subTitle[indexPath.row]
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        FunctionDefault.AlertMessageAction(title: sections[indexPath.section].subTitle[indexPath.row], message: "", targetVC: self)
        // logic
    }
    
    // Delegate MenuSyle6HeaderCellDelegate
    func toggleSection(header: MenuSyle6HeaderCell, section: Int) {
        if section == 0{
            sections[section].expanded = !sections[section].expanded
            
            tableMenu.beginUpdates()
            for i in 0 ..< sections[section].subTitle.count {
                tableMenu.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
            }
            tableMenu.endUpdates()
            
        }else{
            FunctionDefault.AlertMessageAction(title: sections[section].title, message: "", targetVC: self)
        }
    }
    // end
    
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
