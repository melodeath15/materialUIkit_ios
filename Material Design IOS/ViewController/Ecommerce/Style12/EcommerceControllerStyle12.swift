//
//  EcommerceControllerStyle12.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/3/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle12: UIViewController, UITableViewDataSource, UITableViewDelegate, EcommerceStyle1HeaderDelegate, EcommerceStyle12FooterDelegate, EcommerceStyle11SizeDelegate {

    var tableCell = UITableView()
    var header = EcommerceStyle1Header()
    var footer = EcommerceStyle12Footer()
    
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
        header.title.text = "Black Faux Leather"
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.delegate = self
        self.view.addSubview(header)
        
        // create table
        tableCell.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80-60)
        tableCell.delegate = self;
        tableCell.dataSource = self;
        tableCell.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        tableCell.separatorColor = UIColor.clear
        tableCell.allowsSelection = false
        
        // register UINib
        tableCell.register(UINib(nibName: "EcommerceStyle12Header", bundle: nil), forCellReuseIdentifier: "EcommerceStyle12Header")
        tableCell.register(UINib(nibName: "EcommerceStyle12Des", bundle: nil), forCellReuseIdentifier: "EcommerceStyle12Des")
        tableCell.register(UINib(nibName: "EcommerceStyle11Size", bundle: nil), forCellReuseIdentifier: "EcommerceStyle11Size")
        self.view .addSubview(tableCell)
        
        // Create footer
        footer = Bundle.main.loadNibNamed("EcommerceStyle12Footer", owner: nil, options: nil)?.first as! EcommerceStyle12Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-60, width: self.view.frame.size.width, height: 60)
        footer.delegate = self
        self.view.addSubview(footer)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.view.frame.size.height/2.5
        }else if indexPath.row == 1 {
            return 100 + sizeCell
        }else{
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle12Header", for: indexPath) as! EcommerceStyle12Header
            
            cell.imagesArray = ["Ecommerce-12", "Ecommerce-12", "Ecommerce-12", "Ecommerce-12"]
            cell.slider.images = cell.imagesArray
            cell.slider.autoSrcollEnabled = true
            cell.slider.enableArrowIndicator = false
            cell.slider.enablePageIndicator = true
            cell.slider.enableSwipe = true
            cell.slider.allowCircular = false
            
            cell.backgroundColor = UIColor.clear
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle12Des", for: indexPath) as! EcommerceStyle12Des
            cell.valueDes.text = "Wasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and alturuistic amiable far much toward"
            cell.backgroundColor = UIColor.clear
            return cell
        }else{
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
    
    // EcommerceStyle12FooterDelegate
    func AddCart() {
        FunctionDefault.AlertMessage(title: "Add to Cart", message: "", targetVC: self)
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
