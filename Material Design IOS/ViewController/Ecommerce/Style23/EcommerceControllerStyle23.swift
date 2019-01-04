//
//  EcommerceControllerStyle23.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle23: UIViewController, UITableViewDelegate, UITableViewDataSource, EcommerceStyle1HeaderDelegate, EcommerceStyle21CellDelegate, EcommerceStyle20CollectionColorDelegate, EcommerceStyle20SizeDelegate, EcommerceStyle20FooterDelegate {

    var tableCell = UITableView()
    var header = EcommerceStyle1Header()
    var footer = EcommerceStyle20Footer()

    var dataCount = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataCount = [2]
        createView()
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create header
        header = Bundle.main.loadNibNamed("EcommerceStyle1Header", owner: nil, options: nil)?.first as! EcommerceStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Edit"
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.btnBuy.isHidden = true
        header.delegate = self
        self.view.addSubview(header)
        
        // create table
        tableCell.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        tableCell.delegate = self;
        tableCell.dataSource = self;
        tableCell.backgroundColor = UIColor.clear
        tableCell.separatorColor = UIColor.clear
        tableCell.allowsSelection = false
        
        // register UINib
        tableCell.register(UINib(nibName: "EcommerceStyle21Cell", bundle: nil), forCellReuseIdentifier: "EcommerceStyle21Cell")
        tableCell.register(UINib(nibName: "EcommerceStyle20CollectionColor", bundle: nil), forCellReuseIdentifier: "EcommerceStyle20CollectionColor")
        tableCell.register(UINib(nibName: "EcommerceStyle20Size", bundle: nil), forCellReuseIdentifier: "EcommerceStyle20Size")
        
        self.view .addSubview(tableCell)
        
        // create footer
        footer = Bundle.main.loadNibNamed("EcommerceStyle20Footer", owner: nil, options: nil)?.first as! EcommerceStyle20Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width, height: 50)
        footer.btnFilter.setTitle("Apply Changes", for: .normal)
        footer.delegate = self
        self.view.addSubview(footer)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 120
        }else if indexPath.row == 1{
            return 120
        }else {
            return 120
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle21Cell", for: indexPath) as! EcommerceStyle21Cell
            
            cell.img.image = UIImage(named: "Ecommerce-22-img-1")
            cell.title.text = "Zara Jumpsuit Dress"
            cell.size.text = "Size: M"
            cell.price.text = "$ 125"
            cell.valueCount.text = "\(dataCount[indexPath.row])"
            
            cell.index = indexPath as IndexPath
            cell.backgroundColor = UIColor.clear
            cell.delegate = self
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle20CollectionColor", for: indexPath) as! EcommerceStyle20CollectionColor
            
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
            layout.itemSize = CGSize(width: 50, height: 50)
            layout.minimumLineSpacing = 5
            layout.minimumInteritemSpacing = 5
            layout.scrollDirection = .horizontal
            
            cell.collection.setCollectionViewLayout(layout, animated: true)
            cell.collection.register(UINib(nibName: "EcommerceStyle20Cell", bundle:nil), forCellWithReuseIdentifier: "EcommerceStyle20Cell")
            
            cell.dataColor = [UIColor.black, UIColor.blue, UIColor.red, UIColor.yellow, UIColor.groupTableViewBackground, UIColor.white]
            cell.title.text = "SELECT A COLOR"
            cell.delegate = self
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle20Size", for: indexPath) as! EcommerceStyle20Size
            cell.labelSize.text = "SELECT YOUR SIZE"
            cell.backgroundColor = UIColor.clear
            cell.delegate = self
            return cell
        }
        
    }
    
    // EcommerceStyle1HeaderDelegate
    func menu() {
        navigationController?.popViewController(animated: true)
    }
    
    func buy() {
        // not use
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

    
    // EcommerceStyle20CollectionColorDelegate
    func selectedColor(index: Int, data: [UIColor]) {
        FunctionDefault.AlertMessage(title: "\(index)", message: "", targetVC: self)
    }
    //end
    
    // EcommerceStyle20SizeDelegate {
    func xs(){
        // code
    }
    func s(){
        // code
    }
    func m(){
        // code
    }
    func l(){
        // code
    }
    func xl(){
        // code
    }
    // end
    
    // EcommerceStyle20FooterDelegate
    func applyFilter() {
        FunctionDefault.AlertMessage(title: "Change", message: "", targetVC: self)
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
