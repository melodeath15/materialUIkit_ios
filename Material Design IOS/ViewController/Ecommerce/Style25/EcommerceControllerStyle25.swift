//
//  EcommerceControllerStyle25.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle25: UIViewController, UITableViewDelegate, UITableViewDataSource, EcommerceStyle9HeaderDelegate, EcommerceStyle27FooterDelegate {

    var tableCell = UITableView()
    var header = EcommerceStyle9Header()
    var footer = EcommerceStyle27Footer()
    
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
        header.title.text = "Payment"
        header.btnSearch.isHidden = true
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.delegate = self
        self.view.addSubview(header)
        
        // create table
        tableCell.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80-50)
        tableCell.delegate = self;
        tableCell.dataSource = self;
        tableCell.backgroundColor = UIColor.clear
        tableCell.separatorColor = UIColor.clear
        tableCell.allowsSelection = false
        
        // register UINib
        tableCell.register(UINib(nibName: "EcommerceStyle25Payment", bundle: nil), forCellReuseIdentifier: "EcommerceStyle25Payment")
        tableCell.register(UINib(nibName: "EcommerceStyle25Card", bundle: nil), forCellReuseIdentifier: "EcommerceStyle25Card")
        
        self.view .addSubview(tableCell)
        
        // create header
        footer = Bundle.main.loadNibNamed("EcommerceStyle27Footer", owner: nil, options: nil)?.first as! EcommerceStyle27Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width, height: 50)
        footer.backgroundColor = UIColor.clear
        footer.btnOk.setTitle("Next", for: .normal)
        footer.delegate = self
        self.view.addSubview(footer)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle25Payment", for: indexPath) as! EcommerceStyle25Payment
            cell.title.text = "CHOOSE PAYMENT METHOD"
            cell.title1.text = "arno@gmail.com"
            cell.title2.text = ""
            cell.title3.text = "1923-6789-XXXX"
            cell.next2.isHidden = true
            cell.backgroundColor = UIColor.clear
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle25Card", for: indexPath) as! EcommerceStyle25Card
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
    
    // EcommerceStyle27FooterDelegate
    func pushOk() {
        FunctionDefault.AlertMessage(title: "OK", message: "", targetVC: self)
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
