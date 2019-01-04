//
//  EcommerceControllerStyle17.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle17: UIViewController, UITableViewDataSource, UITableViewDelegate, EcommerceStyle15HeaderDelegate, EcommerceStyle11SizeDelegate, EcommerceStyle17FooterDelegate {

    var tableCell = UITableView()
    var header = EcommerceStyle15Header()
    
    var sizeCell = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create header
        header = Bundle.main.loadNibNamed("EcommerceStyle15Header", owner: nil, options: nil)?.first as! EcommerceStyle15Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Ecommerce"
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.delegate = self
        self.view.addSubview(header)
        
        // create table
        tableCell.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        tableCell.delegate = self;
        tableCell.dataSource = self;
        tableCell.backgroundColor = UIColor.white
        tableCell.separatorColor = UIColor.clear
        tableCell.allowsSelection = false
        
        // register UINib
        tableCell.register(UINib(nibName: "EcommerceStyle17Header", bundle: nil), forCellReuseIdentifier: "EcommerceStyle17Header")
        tableCell.register(UINib(nibName: "EcommerceStyle17Cell", bundle: nil), forCellReuseIdentifier: "EcommerceStyle17Cell")
        tableCell.register(UINib(nibName: "EcommerceStyle11Size", bundle: nil), forCellReuseIdentifier: "EcommerceStyle11Size")
        tableCell.register(UINib(nibName: "EcommerceStyle17Footer", bundle: nil), forCellReuseIdentifier: "EcommerceStyle17Footer")
        
        self.view .addSubview(tableCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return self.view.frame.size.height/2
        }else if indexPath.row == 1{
            return 150 + sizeCell
        }else if indexPath.row == 2{
            return 120
        }else{
            return 180
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle17Header", for: indexPath) as! EcommerceStyle17Header
            
            cell.imagesArray = ["Ecommerce-17", "Ecommerce-17", "Ecommerce-17", "Ecommerce-17"]
            cell.slider.images = cell.imagesArray
            cell.slider.autoSrcollEnabled = true
            cell.slider.enableArrowIndicator = false
            cell.slider.enablePageIndicator = true
            cell.slider.enableSwipe = true
            cell.slider.allowCircular = false

            cell.backgroundColor = UIColor.clear
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle17Cell", for: indexPath) as! EcommerceStyle17Cell
            
            cell.tagTitle.text = "Women, Dress, Summer"
            cell.title.text = "Black Faux Leather"
            cell.price.text = "$225"
            cell.des.text = "Wasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and alturuistic amiable far much toward"
            sizeCell = 0
            
            return cell
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle11Size", for: indexPath) as! EcommerceStyle11Size
            cell.delegate = self
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle17Footer", for: indexPath) as! EcommerceStyle17Footer
            cell.delegate = self
            return cell
        }
    }
    
    // EcommerceStyle15HeaderDelegate
    func menu() {
        navigationController?.popViewController(animated: true)
    }
    
    func search() {
        FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)
    }
    
    func buy() {
        FunctionDefault.AlertMessage(title: "Buy", message: "", targetVC: self)
    }
    
    func optional() {
        let actionSheet: UIAlertController = UIAlertController(title: "Choose Option", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {_ in // function for butoon down
            FunctionDefault.AlertMessage(title: "Cancel", message: "", targetVC: self)
        }
        actionSheet.addAction(cancelAction)
        
        
        let saveAction = UIAlertAction(title: "Save", style: .default){ _ in // function button custom
            FunctionDefault.AlertMessage(title: "Save", message: "", targetVC: self)
        }
        actionSheet.addAction(saveAction)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive){ _ in // function button custom with destructive
            FunctionDefault.AlertMessage(title: "Delete", message: "", targetVC: self)
        }
        actionSheet.addAction(deleteAction)
        
        actionSheet.popoverPresentationController?.sourceView = self.view
        actionSheet.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.width-20, y: 60, width: 1, height: 1)
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    // end
    
    // EcommerceStyle11SizeDelegate
    func xs() {
        // code
    }
    
    func s() {
        // code
    }
    
    func m() {
        // code
    }
    
    func l() {
        // code
    }
    
    func xl() {
        // code
    }
    // end
    
    // EcommerceStyle17FooterDelegate
    func color(){
        FunctionDefault.AlertMessage(title: "Color", message: "", targetVC: self)
    }
    
    func qty(){
        FunctionDefault.AlertMessage(title: "Quantity", message: "", targetVC: self)
    }
    
    func addCart(){
        FunctionDefault.AlertMessage(title: "Add Cart", message: "", targetVC: self)
    }
    
    func addWishlis(){
        FunctionDefault.AlertMessage(title: "Add Wishlis", message: "", targetVC: self)
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
