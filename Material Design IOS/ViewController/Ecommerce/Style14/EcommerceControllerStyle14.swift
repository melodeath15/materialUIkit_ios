//
//  EcommerceControllerStyle14.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle14: UIViewController, UITableViewDataSource, UITableViewDelegate, EcommerceStyle1HeaderDelegate, EcommerceStyle14HeaderDelegate, EcommerceStyle14FooterDelegate {

    var tableCell = UITableView()
    var header = EcommerceStyle1Header()
    var footer = EcommerceStyle14Footer()
    
    var sizeCell = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create header
        header = Bundle.main.loadNibNamed("EcommerceStyle1Header", owner: nil, options: nil)?.first as! EcommerceStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Ecommerce"
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.delegate = self
        self.view.addSubview(header)
        
        // create table
        tableCell.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80-120)
        tableCell.delegate = self;
        tableCell.dataSource = self;
        tableCell.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        tableCell.separatorColor = UIColor.clear
        tableCell.allowsSelection = false
        
        // register UINib
        tableCell.register(UINib(nibName: "EcommerceStyle14Header", bundle: nil), forCellReuseIdentifier: "EcommerceStyle14Header")
        tableCell.register(UINib(nibName: "EcommerceStyle14View", bundle: nil), forCellReuseIdentifier: "EcommerceStyle14View")
        self.view .addSubview(tableCell)
        
        
        // create header
        footer = Bundle.main.loadNibNamed("EcommerceStyle14Footer", owner: nil, options: nil)?.first as! EcommerceStyle14Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-120, width: self.view.frame.size.width, height: 120)
        footer.delegate = self
        self.view.addSubview(footer)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return self.view.frame.size.height/2.5
        }else{
            return 150 + sizeCell
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle14Header", for: indexPath) as! EcommerceStyle14Header
            cell.delegate = self
            cell.backgroundColor = UIColor.clear
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle14View", for: indexPath) as! EcommerceStyle14View
            
            cell.title.text = "Velcro White Sneakers"
            cell.tagTitle.text = "Shoes, Sneakers, Summer"
            cell.rating.value = 4
            cell.price.text = "$225"
            cell.valueDes.text = "Wasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and alturuistic amiable far much toward"
            sizeCell = 0
            cell.backgroundColor = UIColor.clear
            return cell
        }
    }
    
    // EcommerceStyle1HeaderDelegate
    func menu() {
        navigationController?.popViewController(animated: true)
    }
    
    func buy(){
        FunctionDefault.AlertMessage(title: "Buy", message: "", targetVC: self)
    }
    // end
    
    //EcommerceStyle14HeaderDelegate
    func love(){
        FunctionDefault.AlertMessage(title: "Love", message: "", targetVC: self)
    }
    // end
    
    // EcommerceStyle14FooterDelegate
    func size(){
        FunctionDefault.AlertMessage(title: "Size", message: "", targetVC: self)
    }
    
    func qty(){
        FunctionDefault.AlertMessage(title: "Quantity", message: "", targetVC: self)
    }
    
    func addCart(){
        FunctionDefault.AlertMessage(title: "Add Cart", message: "", targetVC: self)
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
