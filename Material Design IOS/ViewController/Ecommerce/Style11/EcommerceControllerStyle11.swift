//
//  EcommerceControllerStyle11.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/3/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle11: UIViewController, UITableViewDataSource, UITableViewDelegate, EcommerceStyle1HeaderDelegate, EcommerceStyle7FooterDelegate, EcommerceStyle11CellHeaderDelegate, EcommerceStyle11SizeDelegate {

    var tableCell = UITableView()
    var header = EcommerceStyle1Header()
    var footer = EcommerceStyle7Footer()
    
    var sizeCell = CGFloat()
    var statusShow = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusShow = false
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
        tableCell.register(UINib(nibName: "EcommerceStyle11CellHeader", bundle: nil), forCellReuseIdentifier: "EcommerceStyle11CellHeader")
        tableCell.register(UINib(nibName: "EcommerceStyle11Size", bundle: nil), forCellReuseIdentifier: "EcommerceStyle11Size")
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
            return self.view.frame.size.height/2 + sizeCell
        }else{
            return 120
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle11CellHeader", for: indexPath) as! EcommerceStyle11CellHeader
            cell.title.text = "Black Faux Leather Dress"
            cell.price.text = "$225"

            if statusShow{
                cell.valueDes.text = "Wasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and alturuistic amiable far much toward. Wasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and alturuistic amiable far much toward."
            }else{
                cell.valueDes.text = "Wasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and alturuistic amiable far much toward."
            }
            
            cell.backgroundColor = UIColor.clear
            cell.delegate = self
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle11Size", for: indexPath) as! EcommerceStyle11Size
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
    
    // EcommerceStyle11CellHeaderDelegate
    func showAll(status: Bool) {
        if status{
            sizeCell = 50
        }else{
            sizeCell = 0
        }
        statusShow = status
        tableCell.reloadData()
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
    
    // EcommerceStyle7FooterDelegate
    func addCart(){
        FunctionDefault.AlertMessage(title: "Add to Cart", message: "", targetVC: self)
    }
    
    func buyNow(){
        FunctionDefault.AlertMessage(title: "Add to Wishlish", message: "", targetVC: self)
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
