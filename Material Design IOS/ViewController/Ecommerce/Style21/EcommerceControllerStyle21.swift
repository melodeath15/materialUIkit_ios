//
//  EcommerceControllerStyle21.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle21: UIViewController, UITableViewDelegate, UITableViewDataSource, EcommerceStyle1HeaderDelegate, EcommerceStyle21CellDelegate, EcommerceStyle21FooterDelegate{

    var tableCell = UITableView()
    var header = EcommerceStyle1Header()
    var footer = EcommerceStyle21Footer()
    
    var data = NSArray()
    var dataImg = NSArray()
    var dataCount = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = ["Zara Jumpsuit Dress", "Blue Sky Dress", "Black Faux Leather"]
        dataCount = [2,2,1]
        dataImg = ["Ecommerce-22-img-1", "Ecommerce-22-img-2", "Ecommerce-22-img-1"]
        
        createView()
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create header
        header = Bundle.main.loadNibNamed("EcommerceStyle1Header", owner: nil, options: nil)?.first as! EcommerceStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Shopping Cart"
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.btnBuy.setTitle(" (2)", for: .normal)
        header.delegate = self
        self.view.addSubview(header)
        
        // create table
        tableCell.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80-120)
        tableCell.delegate = self;
        tableCell.dataSource = self;
        tableCell.backgroundColor = UIColor.clear
        tableCell.separatorColor = UIColor.clear
        tableCell.allowsSelection = false
        
        // register UINib
        tableCell.register(UINib(nibName: "EcommerceStyle21Cell", bundle: nil), forCellReuseIdentifier: "EcommerceStyle21Cell")
        
        self.view .addSubview(tableCell)
        
        // create footer
        footer = Bundle.main.loadNibNamed("EcommerceStyle21Footer", owner: nil, options: nil)?.first as! EcommerceStyle21Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-120, width: self.view.frame.size.width, height: 120)
        footer.valuePrice.text = "$250"
        footer.delegate = self
        self.view.addSubview(footer)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle21Cell", for: indexPath) as! EcommerceStyle21Cell
        
        cell.img.image = UIImage(named: "\(dataImg[indexPath.row])")
        cell.title.text = "\(data[indexPath.row])"
        cell.size.text = "Size: M"
        cell.price.text = "$ 125"
        cell.valueCount.text = "\(dataCount[indexPath.row])"
        
        cell.index = indexPath as IndexPath
        cell.backgroundColor = UIColor.clear
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { action, index in
            print("Edit button tapped")
        }
        edit.backgroundColor = .blue
        
        let close = UITableViewRowAction(style: .normal, title: "Close") { action, index in
            print("close button tapped")
        }
        close.backgroundColor = .red
        
        return [close, edit]
    }
    
    // EcommerceStyle1HeaderDelegate
    func menu() {
        navigationController?.popViewController(animated: true)
    }
    
    func buy() {
        FunctionDefault.AlertMessage(title: "Buy", message: "", targetVC: self)
    }
    // end
    
    // EcommerceStyle21CellDelegate
    func plus(index: IndexPath) {
        
        if dataCount[index.row]+1 > 0{
            dataCount.insert(dataCount[index.row]+1, at: index.row)
            dataCount.remove(at: index.row+1)
        
            tableCell.reloadRows(at: [index], with: .none)
        }
    }
    
    func minus(index: IndexPath) {
        
        if dataCount[index.row]-1 > 0{
            dataCount.insert(dataCount[index.row]-1, at: index.row)
            dataCount.remove(at: index.row+1)
        
            tableCell.reloadRows(at: [index], with: .none)
        }
    }
    // end
    
    // EcommerceStyle21FooterDelegate
    func checkout() {
        FunctionDefault.AlertMessage(title: "Checkout", message: "", targetVC: self)
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
