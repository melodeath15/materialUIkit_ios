//
//  EcommerceControllerStyle24.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle24: UIViewController, UITableViewDelegate, UITableViewDataSource, EcommerceStyle9HeaderDelegate, EcommerceStyle24FooterDelegate, EcommerceStyle24InformationDelegate {
    
    var tableCell = UITableView()
    var header = EcommerceStyle9Header()
    var footer = EcommerceStyle24Footer()
    
    var shipping = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shipping = ["Classic Delivery (10 days)", "Express Delivery (5 days)", "Premium Delivery (3 days)"]
        createView()
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create header
        header = Bundle.main.loadNibNamed("EcommerceStyle9Header", owner: nil, options: nil)?.first as! EcommerceStyle9Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Shipping"
        header.btnSearch.isHidden = true
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.delegate = self
        self.view.addSubview(header)
        
        // create table
        tableCell.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80-180)
        tableCell.delegate = self;
        tableCell.dataSource = self;
        tableCell.backgroundColor = UIColor.clear
        tableCell.separatorColor = UIColor.clear
        tableCell.allowsSelection = false
        
        // register UINib
        tableCell.register(UINib(nibName: "EcommerceStyle24Information", bundle: nil), forCellReuseIdentifier: "EcommerceStyle24Information")
        tableCell.register(UINib(nibName: "EcommerceStyle24Cost", bundle: nil), forCellReuseIdentifier: "EcommerceStyle24Cost")
        
        self.view .addSubview(tableCell)
        
        // create header
        footer = Bundle.main.loadNibNamed("EcommerceStyle24Footer", owner: nil, options: nil)?.first as! EcommerceStyle24Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-180, width: self.view.frame.size.width, height: 180)
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "$250")
        attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
        footer.valueOldSubtotal.attributedText = attributeString

        footer.valueSubtotal.text = "$225"
        footer.valueCost.text = "$10"
        footer.valueTotal.text = "$235"
        
        footer.backgroundColor = UIColor.clear
        footer.delegate = self
        self.view.addSubview(footer)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 250
        }else{
            return 150
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle24Information", for: indexPath) as! EcommerceStyle24Information
            
            cell.title.text = "SHIPPING INFORMATION"
            
            cell.backgroundColor = UIColor.clear
            cell.delegate = self
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle24Cost", for: indexPath) as! EcommerceStyle24Cost
            
            cell.title.text = "SHIPPING COST"
            cell.cek1.setTitle("Classic Delivery (10 days)", for: .normal)
            cell.cek2.setTitle("Express Delivery (5 days)", for: .normal)
            cell.cek3.setTitle("Premium Delivery (3 days)", for: .normal)
            
            cell.price1.text = "$10"
            cell.price2.text = "$20"
            cell.price3.text = "$30"
            
            cell.backgroundColor = UIColor.clear
            return cell
        }
    }
    

    // EcommerceStyle9HeaderDelegate
    func munu() {
        navigationController?.popViewController(animated: true)
    }
    
    func search() {
        // not use
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
    
    // EcommerceStyle24InformationDelegate
    func getTextfield(tag: Int, text: String) {
        print(text)
    }
    // end
    
    // EcommerceStyle24FooterDelegate
    func next(){
        FunctionDefault.AlertMessage(title: "Next", message: "", targetVC: self)
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
