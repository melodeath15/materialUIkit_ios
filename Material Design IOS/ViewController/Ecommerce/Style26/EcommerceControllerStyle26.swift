//
//  EcommerceControllerStyle26.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle26: UIViewController, UITableViewDelegate, UITableViewDataSource, EcommerceStyle9HeaderDelegate, EcommerceStyle24FooterDelegate, EcommerceStyle26ImgDelegate, EcommerceStyle26AddressDelegate {

    var tableCell = UITableView()
    var header = EcommerceStyle9Header()
    var footer = EcommerceStyle24Footer()
    
    var order = NSArray()
    var orderImg = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        order = ["Zara Jumpsuit Dress", "Black Faux Leather"]
        orderImg = ["Ecommerce-22-img-1", "Ecommerce-22-img-2"]
        createView()
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create header
        header = Bundle.main.loadNibNamed("EcommerceStyle9Header", owner: nil, options: nil)?.first as! EcommerceStyle9Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Order Confirmation"
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
        tableCell.register(UINib(nibName: "EcommerceStyle26Img", bundle: nil), forCellReuseIdentifier: "EcommerceStyle26Img")
        tableCell.register(UINib(nibName: "EcommerceStyle26Address", bundle: nil), forCellReuseIdentifier: "EcommerceStyle26Address")
        
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
        footer.btnNext.setTitle("Finish Order", for: .normal)
        
        footer.backgroundColor = UIColor.clear
        footer.delegate = self
        self.view.addSubview(footer)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2{
            return 200
        }else{
            return 120
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle26Address", for: indexPath) as! EcommerceStyle26Address
            cell.street.text = "Madelaine Arno \n6259 Montoe Street \nBakersfield, CA 93306"
            cell.numberPayment.text = "1923.6789.xxxx"
            cell.delegate = self
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle26Img", for: indexPath) as! EcommerceStyle26Img
            
            cell.title.text = "\(order[indexPath.row])"
            cell.img.image = UIImage(named: "\(orderImg[indexPath.row])")
            cell.size.text = "Size : M"
            cell.qty.text = "Quantity : 1"
            cell.price.text = "$125"
            
            cell.backgroundColor = UIColor.clear
            cell.index = indexPath
            cell.delegate = self
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
    
    // EcommerceStyle26ImgDelegate
    func pushCellOrder(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(order[index.row])", message: "\(index.row)", targetVC: self)
    }
    // end
    
    // EcommerceStyle26AddressDelegate
    func editAddress() {
        FunctionDefault.AlertMessage(title: "Edit Address", message: "", targetVC: self)
    }
    
    func editPayment() {
        FunctionDefault.AlertMessage(title: "Edit Payment", message: "", targetVC: self)
    }
    // end
    
    // EcommerceStyle24FooterDelegate
    func next(){
        FunctionDefault.AlertMessage(title: "Finish Order", message: "", targetVC: self)
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
