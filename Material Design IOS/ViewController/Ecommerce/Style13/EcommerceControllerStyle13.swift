//
//  EcommerceControllerStyle13.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle13: UIViewController, UITableViewDataSource, UITableViewDelegate, EcommerceStyle1HeaderDelegate, EcommerceStyle13HeaderDelegate, EcommerceStyle13ViewDelegate, EcommerceStyle7FooterDelegate {

    var tableCell = UITableView()
    var header = EcommerceStyle1Header()
    var footer = EcommerceStyle7Footer()
    
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
        tableCell.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80-50)
        tableCell.delegate = self;
        tableCell.dataSource = self;
        tableCell.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        tableCell.separatorColor = UIColor.clear
        tableCell.allowsSelection = false
        
        // register UINib
        tableCell.register(UINib(nibName: "EcommerceStyle13Header", bundle: nil), forCellReuseIdentifier: "EcommerceStyle13Header")
        tableCell.register(UINib(nibName: "EcommerceStyle13View", bundle: nil), forCellReuseIdentifier: "EcommerceStyle13View")
        self.view .addSubview(tableCell)
        
        // Create footer
        footer = Bundle.main.loadNibNamed("EcommerceStyle7Footer", owner: nil, options: nil)?.first as! EcommerceStyle7Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width, height: 50)
        
        footer.btnBuy.backgroundColor = UIColor.white
        footer.btnBuy.setTitle("Add to Wishlist", for: .normal)
        footer.btnBuy.setTitleColor(UIColor.black, for: .normal)
        
        footer.btnAdd.backgroundColor = UIColor.init(red: 250/255.0, green: 163/255.0, blue: 24/255.0, alpha: 1)
        footer.btnAdd.setTitleColor(UIColor.white, for: .normal)
        footer.btnAdd.setImage(UIImage(named: "buy"), for: .normal)
        
        footer.delegate = self
        self.view.addSubview(footer)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.view.frame.size.height/2
        }else{
            return 180
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle13Header", for: indexPath) as! EcommerceStyle13Header
            
            cell.data = ["Ecommerce-13", "Ecommerce-13", "Ecommerce-13", "Ecommerce-13"]
            cell.collection.register(UINib(nibName: "EcommerceStyle13Img", bundle: nil), forCellWithReuseIdentifier: "EcommerceStyle13Img")
            cell.collection.contentInset = UIEdgeInsetsMake(10, 30, 10, 30)
            cell.collection.decelerationRate = UIScrollViewDecelerationRateFast
            
            cell.backgroundColor = UIColor.clear
            cell.delegate = self
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle13View", for: indexPath) as! EcommerceStyle13View
            
            cell.title.text = "Sky Blue Dress"
            cell.tagTitle.text = "Women, Dress, Summer"
            cell.price.text = "$225"
            cell.valueDes.text = "Wasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and alturuistic amiable far much toward"
            
            cell.backgroundColor = UIColor.clear
            cell.delegate = self
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
    
    //EcommerceStyle13HeaderDelegate
    func didSelectImg(index: NSIndexPath, data: NSArray){
    
    }
    
    func showImg(index: Int, data: NSArray){
    
    }
    // end
    
    // EcommerceStyle13ViewDelegate
    func productSize(){
        FunctionDefault.AlertMessage(title: "Size", message: "", targetVC: self)
    }
    
    func productQty(){
        FunctionDefault.AlertMessage(title: "Qty", message: "", targetVC: self)
    }
    // end
    
    // EcommerceStyle7FooterDelegate
    func addCart() {
        FunctionDefault.AlertMessage(title: "Add to Cart", message: "", targetVC: self)
    }
    
    func buyNow() {
        FunctionDefault.AlertMessage(title: "Buy Now", message: "", targetVC: self)
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
