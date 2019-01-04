//
//  EcommerceControllerStyle9Tap1.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/3/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle9Tap1: UIViewController, IndicatorInfoProvider, UITableViewDelegate, UITableViewDataSource, EcommerceStyle9CellDelegate {
    
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
        listImg = ["Ecommerce-9-img-1", "Ecommerce-9-img-2"]
        listName = ["Sky Blue Dress", "Velcro Sneaker White"]
        createView()
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create table
        tableCell.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-120)
        tableCell.delegate = self;
        tableCell.dataSource = self;
        tableCell.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        tableCell.separatorColor = UIColor.clear
        tableCell.allowsSelection = false
        
        // register UINib
        tableCell.register(UINib(nibName: "EcommerceStyle9Cell", bundle: nil), forCellReuseIdentifier: "EcommerceStyle9Cell")
        self.view .addSubview(tableCell)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listName.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height/2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle9Cell", for: indexPath) as! EcommerceStyle9Cell
        
        cell.img.image = UIImage(named: "\(listImg[indexPath.row])")
        cell.title.text = "\(listName[indexPath.row])"
        cell.rating.value = 4
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "$255")
        attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
        cell.valueOld.attributedText = attributeString
        
        cell.valueNew.text = "$125"
        
        cell.index = indexPath as NSIndexPath
        cell.delegate = self
        return cell
    }
    
    // EcommerceStyle9CellDelegate
    func pushCell(index: NSIndexPath){
        FunctionDefault.AlertMessage(title: "\(listName[index.row])", message: "\(index.row)", targetVC: self)
    }
    
    func shop(index: NSIndexPath) {
        FunctionDefault.AlertMessage(title: "Shop", message: "\(index.row)", targetVC: self)
    }
    
    func love(index: NSIndexPath) {
        FunctionDefault.AlertMessage(title: "Love", message: "\(index.row)", targetVC: self)
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
