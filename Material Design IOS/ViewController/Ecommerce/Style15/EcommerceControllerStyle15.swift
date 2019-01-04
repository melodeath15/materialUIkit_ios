//
//  EcommerceControllerStyle15.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle15: UIViewController, UITableViewDataSource, UITableViewDelegate, EcommerceStyle15HeaderDelegate, EcommerceStyle15FooterDelegate, EcommerceStyle11SizeDelegate {

    var tableCell = UITableView()
    var bg = EcommerceStyle15Bg()
    var header = EcommerceStyle15Header()
    var footer = EcommerceStyle15Footer()
    
    var sizeCell = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)

        // create bg
        bg = Bundle.main.loadNibNamed("EcommerceStyle15Bg", owner: nil, options: nil)?.first as! EcommerceStyle15Bg
        bg.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        bg.img.image = UIImage(named: "Ecommerce-15")
        self.view.addSubview(bg)
        
        // create header
        header = Bundle.main.loadNibNamed("EcommerceStyle15Header", owner: nil, options: nil)?.first as! EcommerceStyle15Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Ecommerce"
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.delegate = self
        self.view.addSubview(header)
        
        // create table
        tableCell.frame = CGRect(x: 10, y: self.view.frame.size.height/2, width: self.view.frame.size.width-20, height: self.view.frame.size.height/2.5)
        tableCell.delegate = self;
        tableCell.dataSource = self;
        tableCell.backgroundColor = UIColor.white
        tableCell.separatorColor = UIColor.clear
        tableCell.allowsSelection = false
        
        // register UINib
        tableCell.register(UINib(nibName: "EcommerceStyle15View", bundle: nil), forCellReuseIdentifier: "EcommerceStyle15View")
        tableCell.register(UINib(nibName: "EcommerceStyle11Size", bundle: nil), forCellReuseIdentifier: "EcommerceStyle11Size")
        self.view .addSubview(tableCell)
        
        // create header
        footer = Bundle.main.loadNibNamed("EcommerceStyle15Footer", owner: nil, options: nil)?.first as! EcommerceStyle15Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width, height: 50)
        footer.valuePrice.text = "$225"
        footer.delegate = self
        self.view.addSubview(footer)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 150 + sizeCell
        }else{
            return 120
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle15View", for: indexPath) as! EcommerceStyle15View
        
            cell.title.text = "White Stripped Denim Shirt"
            cell.tagTitle.text = "Women, Shirt, Summer"
            cell.rating.value = 4
            cell.valueDes.text = "Wasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and alturuistic amiable far much toward"
        
            cell.backgroundColor = UIColor.clear
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle11Size", for: indexPath) as! EcommerceStyle11Size
            cell.delegate = self
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
        // code
    }
    
    func s() {
        // code
    }
    
    func m() {
        // code
    }
    
    func l() {
        // code
    }
    
    func xl() {
        // code
    }
    // end
    
    // EcommerceStyle15FooterDelegate
    func addCart() {
        FunctionDefault.AlertMessage(title: "Add Cart", message: "", targetVC: self)
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
