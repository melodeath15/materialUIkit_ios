//
//  EcommerceControllerStyle2Tap1.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/3/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle2Tap1: UIViewController, IndicatorInfoProvider, UITableViewDelegate, UITableViewDataSource {
    
    var itemInfo: IndicatorInfo = "View"
    var tableCell = UITableView()
    
    var listImg = NSArray()
    var listName = NSArray()
    var listCount = NSArray()
    
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listImg = ["Ecommerce-2-img-1", "Ecommerce-2-img-2", "Ecommerce-2-img-3"]
        listName = ["Round Neck Dress", "Retro Printed Dress", "Seamed Plain Dress"]
        listCount = ["12", "22", "22"]
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
        tableCell.register(UINib(nibName: "EcommerceStyle2CellLeft", bundle: nil), forCellReuseIdentifier: "EcommerceStyle2CellLeft")
        tableCell.register(UINib(nibName: "EcommerceStyle2CellRight", bundle: nil), forCellReuseIdentifier: "EcommerceStyle2CellRight")
        self.view .addSubview(tableCell)

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listName.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height/2.5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0{
            print("a\(indexPath.row)")
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle2CellLeft", for: indexPath) as! EcommerceStyle2CellLeft
            cell.title.text = "\(listName[indexPath.row])"
            cell.count.text = "\(listCount[indexPath.row]) Items"
            cell.img.image = UIImage(named: "\(listImg[indexPath.row])")
            cell.backgroundColor = UIColor.clear
            return cell
        }else{
            print("m\(indexPath.row)")
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle2CellRight", for: indexPath) as! EcommerceStyle2CellRight
            cell.title.text = "\(listName[indexPath.row])"
            cell.count.text = "\(listCount[indexPath.row]) Items"
            cell.img.image = UIImage(named: "\(listImg[indexPath.row])")
            cell.backgroundColor = UIColor.clear
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(listName[indexPath.row])", message: "\(indexPath.row)", targetVC: self)
    }
    
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
