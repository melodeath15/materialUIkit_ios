//
//  EcommerceControllerStyle20.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle20: UIViewController, UITableViewDelegate, UITableViewDataSource, EcommerceStyle1HeaderDelegate, EcommerceStyle20PriceDelegate, EcommerceStyle20CollectionColorDelegate, EcommerceStyle20SizeDelegate, EcommerceStyle20CekBoxDelegate, EcommerceStyle20FooterDelegate {
    
    var tableCell = UITableView()
    var header = EcommerceStyle1Header()
    var footer = EcommerceStyle20Footer()
    
    var resizeCekbox = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create header
        header = Bundle.main.loadNibNamed("EcommerceStyle1Header", owner: nil, options: nil)?.first as! EcommerceStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Filter"
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.btnBuy.isHidden = true
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
        tableCell.register(UINib(nibName: "EcommerceStyle20Price", bundle: nil), forCellReuseIdentifier: "EcommerceStyle20Price")
        tableCell.register(UINib(nibName: "EcommerceStyle20CollectionColor", bundle: nil), forCellReuseIdentifier: "EcommerceStyle20CollectionColor")
        tableCell.register(UINib(nibName: "EcommerceStyle20Size", bundle: nil), forCellReuseIdentifier: "EcommerceStyle20Size")
        tableCell.register(UINib(nibName: "EcommerceStyle20CekBox", bundle: nil), forCellReuseIdentifier: "EcommerceStyle20CekBox")

        self.view .addSubview(tableCell)
        
        // create footer
        footer = Bundle.main.loadNibNamed("EcommerceStyle20Footer", owner: nil, options: nil)?.first as! EcommerceStyle20Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width, height: 50)
        footer.delegate = self
        self.view.addSubview(footer)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 110
        }else if indexPath.row == 1{
            return 120
        }else if indexPath.row == 2{
            return 120
        }else{
            return resizeCekbox
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle20Price", for: indexPath) as! EcommerceStyle20Price
            
            cell.title.text = "PRICE RANGE"
            
            let interval = [Interval(min: 0.0, max: 100.0, stepValue: 1)]
            let preSelectedRange = RangeValue(lower: 0, upper: 50)
            cell.slider.configureSlider(intervals: interval, preSelectedRange: preSelectedRange)
            cell.minimumLabel.text = "$\(cell.slider.discreteCurrentValue.lower)"
            cell.maxmimumLabel.text = "$\(cell.slider.discreteCurrentValue.upper)"
            
            cell.index = indexPath as NSIndexPath
            cell.delegate = self
            cell.backgroundColor = UIColor.clear
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
            cell.delegate = self
            return cell
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle20Size", for: indexPath) as! EcommerceStyle20Size
            cell.labelSize.text = "PRODUCT SIZE"
            cell.backgroundColor = UIColor.clear
            cell.delegate = self
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EcommerceStyle20CekBox", for: indexPath) as! EcommerceStyle20CekBox
            cell.title.text = "BRANDS"
            
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.itemSize = CGSize(width: self.view.frame.size.width/2.5, height: 40)
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            layout.scrollDirection = .vertical
            
            cell.collection.setCollectionViewLayout(layout, animated: true)
            cell.collection.register(UINib(nibName: "EcommerceStyle20CellCekBox", bundle:nil), forCellWithReuseIdentifier: "EcommerceStyle20CellCekBox")
            
            cell.dataCekbox = ["Zara", "Asos", "Armani", "Armani", "Fred Perry", "Fred Perry", "Hugo Boss", "Hugo Boss", "Chanel", "Chanel", "Burberry", "Burberry"]

            let total = Double(cell.dataCekbox.count)
            let collume = Double(2.0)
            let totalColl = ceil(total/collume)
            
            resizeCekbox = CGFloat(totalColl) * 50
            
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
    
    // EcommerceStyle20PriceDelegate
    func handleSlider(min: Float, max: Float, index: NSIndexPath) {
        print("A = \(min), B = \(max)")
        let cell = tableCell.cellForRow(at: index as IndexPath) as! EcommerceStyle20Price
        cell.minimumLabel.text = "$ \(Int(min))"
        cell.maxmimumLabel.text = "$ \(Int(max))"
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
    
    // EcommerceStyle20CekBoxDelegate
    func cekBox(index: Int, cekState: M13Checkbox, data: String) {
        FunctionDefault.AlertMessage(title: "\(data)", message: "\(cekState.checkState.rawValue)", targetVC: self)
    }
    // end
    
    // EcommerceStyle20FooterDelegate
    func applyFilter() {
        FunctionDefault.AlertMessage(title: "Filter", message: "", targetVC: self)
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
