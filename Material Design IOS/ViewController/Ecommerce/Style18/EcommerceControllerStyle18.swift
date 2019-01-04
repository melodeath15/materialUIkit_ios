//
//  EcommerceControllerStyle18.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle18: UIViewController, UITableViewDataSource, UITableViewDelegate, EcommerceStyle15HeaderDelegate, EcommerceStyle11SizeDelegate, EcommerceStyle18OptionDelegate, EcommerceStyle18CollectionDelegate, EcommerceStyle18FooterDelegate {
    
    var tableCell = UITableView()
    var header = EcommerceStyle15Header()
    
    var sizeCell = CGFloat()
    var sizeCollection = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create header
        header = Bundle.main.loadNibNamed("EcommerceStyle15Header", owner: nil, options: nil)?.first as! EcommerceStyle15Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Ecommerce"
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
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
        tableCell.register(UINib(nibName: "EcommerceStyle17Header", bundle: nil), forCellReuseIdentifier: "EcommerceStyle17Header")
        tableCell.register(UINib(nibName: "EcommerceStyle18CellTitle", bundle: nil), forCellReuseIdentifier: "EcommerceStyle18CellTitle")
        tableCell.register(UINib(nibName: "EcommerceStyle11Size", bundle: nil), forCellReuseIdentifier: "EcommerceStyle11Size")
        tableCell.register(UINib(nibName: "EcommerceStyle18Option", bundle: nil), forCellReuseIdentifier: "EcommerceStyle18Option")
        tableCell.register(UINib(nibName: "EcommerceStyle18Deskripsi", bundle: nil), forCellReuseIdentifier: "EcommerceStyle18Deskripsi")
        tableCell.register(UINib(nibName: "EcommerceStyle18Collection", bundle: nil), forCellReuseIdentifier: "EcommerceStyle18Collection")
        tableCell.register(UINib(nibName: "EcommerceStyle18Footer", bundle: nil), forCellReuseIdentifier: "EcommerceStyle18Footer")
        
        self.view .addSubview(tableCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return self.view.frame.size.height/1.5
        }else if indexPath.row == 1{
            return 50
        }else if indexPath.row == 2{
            return 50
        }else if indexPath.row == 3{
            return 50
        }else if indexPath.row == 4{
            return 100 + sizeCell
        }else if indexPath.row == 5{
            return 0 + sizeCollection
        }else{
            return 120
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle17Header", for: indexPath) as! EcommerceStyle17Header
            
            cell.imagesArray = ["Ecommerce-17", "Ecommerce-17", "Ecommerce-17", "Ecommerce-17"]
            cell.slider.images = cell.imagesArray
            cell.slider.autoSrcollEnabled = true
            cell.slider.enableArrowIndicator = false
            cell.slider.enablePageIndicator = true
            cell.slider.enableSwipe = true
            cell.slider.allowCircular = false
            
            cell.backgroundColor = UIColor.clear
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle18CellTitle", for: indexPath) as! EcommerceStyle18CellTitle
            
            cell.title.text = "Black Faux Leather"
            cell.tagTitle.text = "Women, Dress, Summer"
            cell.price.text = "$225"
            
            return cell
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle11Size", for: indexPath) as! EcommerceStyle11Size
            cell.labelSize.isHidden = true
            cell.delegate = self
            return cell
        }else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle18Option", for: indexPath) as! EcommerceStyle18Option
            cell.delegate = self
            return cell
        }else if indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle18Deskripsi", for: indexPath) as! EcommerceStyle18Deskripsi
            cell.des.text = "Wasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and alturuistic amiable far much toward"
            sizeCell = 0
            return cell
        }else if indexPath.row == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle18Collection", for: indexPath) as! EcommerceStyle18Collection
            
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.itemSize = CGSize(width: self.view.frame.size.width/2, height: self.view.frame.size.height/2.5)
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
                        
            cell.collection.setCollectionViewLayout(layout, animated: true)
            cell.collection.register(UINib(nibName: "EcommerceStyle1Cell", bundle:nil), forCellWithReuseIdentifier: "EcommerceStyle1Cell")
            cell.collection.isScrollEnabled = false
            
            cell.title.text = "RELATED PRODUCTS"
            
            cell.listImg = ["Ecommerce-18-img-2", "Ecommerce-18-img-3"]
            cell.listName = ["Zara Jumpsuit Dress", "Black Faux Leather"]
            
            let total = Double(cell.listImg.count)
            let collume = Double(2.0)
            let totalColl = ceil(total/collume)
            
            sizeCollection = CGFloat(totalColl) * self.view.frame.size.height/2.1
            
            cell.delegate = self
            cell.backgroundColor = UIColor.clear
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle18Footer", for: indexPath) as! EcommerceStyle18Footer
            cell.delegate = self
            cell.backgroundColor = UIColor.clear
            return cell
        }
    }
    
    // EcommerceStyle15HeaderDelegate
    func menu() {
        navigationController?.popViewController(animated: true)
    }
    
    func search() {
        FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)
    }
    
    func buy() {
        FunctionDefault.AlertMessage(title: "Buy", message: "", targetVC: self)
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
    
    // EcommerceStyle11SizeDelegate
    func xs() {
        print("XS")
        // code
    }
    
    func s() {
        print("S")
        // code
    }
    
    func m() {
        print("M")
        // code
    }
    
    func l() {
        print("L")
        // code
    }
    
    func xl() {
        print("XL")
        // code
    }
    // end
    
    // EcommerceStyle18OptionDelegate
    func color(){
        FunctionDefault.AlertMessage(title: "Color", message: "", targetVC: self)
    }
    func qty(){
        FunctionDefault.AlertMessage(title: "Quantity", message: "", targetVC: self)
    }
    // end
    
    // EcommerceStyle18CollectionDelegate
    func didSelect(index: Int) {
        FunctionDefault.AlertMessage(title: "\(index)", message: "", targetVC: self)
    }
    // end
    
    // EcommerceStyle18FooterDelegate
    func addWishlist() {
        FunctionDefault.AlertMessage(title: "Add Wishlist", message: "", targetVC: self)
    }
    
    func addCart() {
        FunctionDefault.AlertMessage(title: "Add Cart", message: "", targetVC: self)
    }
    //end
    
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
