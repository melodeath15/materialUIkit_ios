//
//  EcommerceControllerStyle10.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/3/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle10: UIViewController, UITableViewDataSource, UITableViewDelegate, EcommerceStyle1HeaderDelegate {
    
    var tableCell = UITableView()
    var header = EcommerceStyle1Header()
    var headerCatalog = EcommerceStyle3View()
    
    var listImg = NSArray()
    var listName = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listImg = ["Ecommerce-10-img-1", "Ecommerce-10-img-2", "Ecommerce-10-img-3", "Ecommerce-10-img-4"]
        listName = ["Zara Jumpsuit Dress", "Black Faux Leather", "Zara Sneakers", "Velcro Sneakers White"]
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
        
        // create headerCatalog
        headerCatalog = Bundle.main.loadNibNamed("EcommerceStyle3View", owner: nil, options: nil)?.first as! EcommerceStyle3View
        headerCatalog.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 30)
        headerCatalog.titleHidden.text = "Catalog/"
        headerCatalog.titleActive.text = "Women"
        self.view.addSubview(headerCatalog)
        
        // create table
        tableCell.frame = CGRect(x: 0, y: 110, width: self.view.frame.size.width, height: self.view.frame.size.height-110)
        tableCell.delegate = self;
        tableCell.dataSource = self;
        tableCell.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        tableCell.separatorColor = UIColor.clear
        tableCell.allowsSelection = true
        
        // register UINib
        tableCell.register(UINib(nibName: "EcommerceStyle10Cell", bundle: nil), forCellReuseIdentifier: "EcommerceStyle10Cell")
        self.view .addSubview(tableCell)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listName.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height/5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle10Cell", for: indexPath) as! EcommerceStyle10Cell
        
        cell.img.image = UIImage(named: "\(listImg[indexPath.row])")
        cell.category.text = "Dress"
        cell.title.text = "\(listName[indexPath.row])"
        cell.rating.value = 4

        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "$255")
        attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
        cell.valueOld.attributedText = attributeString
        
        cell.valueNew.text = "$125"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(listName[indexPath.row])", message: "\(indexPath.row)", targetVC: self)
    }
    
    
    // EcommerceStyle1HeaderDelegate
    func menu() {
        navigationController?.popViewController(animated: true)
    }
    
    func buy(){
        FunctionDefault.AlertMessage(title: "Buy", message: "", targetVC: self)
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
