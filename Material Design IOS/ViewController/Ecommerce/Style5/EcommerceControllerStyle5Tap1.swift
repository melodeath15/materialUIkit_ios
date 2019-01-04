//
//  EcommerceControllerStyle5Tap1.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/3/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle5Tap1: UIViewController, IndicatorInfoProvider, UITableViewDelegate, UITableViewDataSource, EcommerceStyle5HeaderDelegate {

    var itemInfo: IndicatorInfo = "View"
    var tableCell = UITableView()
    
    var listImg = NSArray()
    
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listImg = ["Ecommerce-5-img-2", "Ecommerce-5-img-3", "Ecommerce-5-img-2", "Ecommerce-5-img-3"]
        createView()
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create table
        tableCell.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-120)
        tableCell.delegate = self;
        tableCell.dataSource = self;
        tableCell.backgroundColor = UIColor.clear
        tableCell.separatorColor = UIColor.clear
        tableCell.allowsSelection = true
        
        // register UINib
        tableCell.register(UINib(nibName: "EcommerceStyle5Header", bundle: nil), forCellReuseIdentifier: "EcommerceStyle5Header")
        tableCell.register(UINib(nibName: "EcommerceStyle5CellLeft", bundle: nil), forCellReuseIdentifier: "EcommerceStyle5CellLeft")
        tableCell.register(UINib(nibName: "EcommerceStyle5CellRight", bundle: nil), forCellReuseIdentifier: "EcommerceStyle5CellRight")
        self.view .addSubview(tableCell)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listImg.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height/2.5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle5Header", for: indexPath) as! EcommerceStyle5Header
            cell.nameCatalog.text = "WOMEN CATALOG"
            cell.title.text = "Autumn Look"
            cell.backgroundColor = UIColor.clear
            cell.delegate = self
            return cell

        }else{
            if indexPath.row % 2 != 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle5CellRight", for: indexPath) as! EcommerceStyle5CellRight
                cell.brand.text = "New Arrival"
                cell.category.text = "Jackets"
                cell.backgroundColor = UIColor.clear
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle5CellLeft", for: indexPath) as! EcommerceStyle5CellLeft
                cell.category.text = "BOOTS COLLECTION"
                cell.labelUpto.text = "Up to"
                cell.valueDIskon.text = "50% OFF"
                cell.backgroundColor = UIColor.clear
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(indexPath.row)", message: "", targetVC: self)
    }
    
    // EcommerceStyle5HeaderDelegate
    func shop() {
        FunctionDefault.AlertMessage(title: "Shop", message: "", targetVC: self)
    }
    // end
    
    // IndicatorInfoProvider
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
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
