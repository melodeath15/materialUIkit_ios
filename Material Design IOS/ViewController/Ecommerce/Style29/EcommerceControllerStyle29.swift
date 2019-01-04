//
//  EcommerceControllerStyle29.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle29: UIViewController, UITableViewDelegate, UITableViewDataSource, EcommerceStyle1HeaderDelegate {

    var tableCell = UITableView()
    var header = EcommerceStyle1Header()
    var name = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name = ["Madelaine Arno", "Micheale Angelo", "Anna Hudgnes", "Terry Truckers", "Denis Tirta Prada", "Madelaine Arno", "Micheale Angelo", "Anna Hudgnes", "Terry Truckers", "Denis Tirta Prada"]
        createView()
    }
    
    func createView(){
        // create header
        header = Bundle.main.loadNibNamed("EcommerceStyle1Header", owner: nil, options: nil)?.first as! EcommerceStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "User Review (4)"
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.btnBuy.isHidden = true
        header.delegate = self
        self.view.addSubview(header)
        
        
        // create table
        tableCell.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        tableCell.delegate = self;
        tableCell.dataSource = self;
        tableCell.backgroundColor = UIColor.clear
        tableCell.separatorColor = UIColor.clear
        tableCell.allowsSelection = true
        
        // register UINib
        tableCell.register(UINib(nibName: "EcommerceStyle29Cell", bundle: nil), forCellReuseIdentifier: "EcommerceStyle29Cell")
        self.view .addSubview(tableCell)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle29Cell", for: indexPath) as! EcommerceStyle29Cell
        
        cell.title.text = "\(name[indexPath.row])"
        cell.des.text = "Dummy gets a first hand experience of Cape Town's booming house scene. Reed Sean Stanley's review of Pitchfork Paris"
        cell.time.text = "2 hourse ago"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(name[indexPath.row])", message: "", targetVC: self)
    }
    
    // EcommerceStyle1HeaderDelegate
    func menu() {
        navigationController?.popViewController(animated: true)
    }
    
    func buy() {
        // not use
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
