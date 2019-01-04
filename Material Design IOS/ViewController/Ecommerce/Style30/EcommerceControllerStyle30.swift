//
//  EcommerceControllerStyle30.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle30: UIViewController, UITableViewDelegate, UITableViewDataSource, EcommerceStyle1HeaderDelegate, EcommerceStyle30CellDelegate {
    
    var tableCell = UITableView()
    var header = EcommerceStyle1Header()
    var dataImg  = NSArray()
    var dataName = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataImg = ["Ecommerce-30-img-1", "Ecommerce-30-img-2", "Ecommerce-30-img-1", "Ecommerce-30-img-2"]
        dataName = ["WOMAN COLLECTIONS", "MEN COLLECTIONS", "WOMAN COLLECTIONS", "MEN COLLECTIONS"]
        
        createView()
    }
    
    func createView(){
        // create header
        header = Bundle.main.loadNibNamed("EcommerceStyle1Header", owner: nil, options: nil)?.first as! EcommerceStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Ecommerce"
        
        header.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.addSubview(header)
        
        
        // create table
        tableCell.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        tableCell.delegate = self;
        tableCell.dataSource = self;
        tableCell.backgroundColor = UIColor.clear
        tableCell.separatorColor = UIColor.clear
        tableCell.allowsSelection = false
        
        // register UINib
        tableCell.register(UINib(nibName: "EcommerceStyle30Cell", bundle: nil), forCellReuseIdentifier: "EcommerceStyle30Cell")
        self.view .addSubview(tableCell)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataImg.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ((self.view.frame.size.height-80)/2)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle30Cell", for: indexPath) as! EcommerceStyle30Cell
        
        cell.img.image = UIImage(named: "\(dataImg[indexPath.row])")
        cell.title.text = "\(dataName[indexPath.row])"
        
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
    
    // EcommerceStyle1HeaderDelegate
    func menu() {
        // not use
    }
    
    func buy() {
        FunctionDefault.AlertMessage(title: "Buy", message: "", targetVC: self)
    }
    // end
    
    // EcommerceStyle30CellDelegate
    func shopNow(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(dataName[index.row])", message: "\(index.row)", targetVC: self)
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
