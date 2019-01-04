//
//  EcommerceControllerStyle19.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle19: UIViewController, EcommerceStyle15HeaderDelegate, EcommerceStyle19SizeDelegate, EcommerceStyle19OptionDelegate, EcommerceStyle19FooterDelegate {

    var tableCell = UITableView()
    var header = EcommerceStyle15Header()
    var sliderImg = EcommerceStyle19Header()
    var viewSize = EcommerceStyle19Size()
    var viewOption = EcommerceStyle19Option()
    var viewFooter = EcommerceStyle19Footer()
    
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
        header.title.text = "Black Faux Dress"
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.btnSearch.isHidden = true
        header.delegate = self
        self.view.addSubview(header)
        
        // create sliderImg
        sliderImg = Bundle.main.loadNibNamed("EcommerceStyle19Header", owner: nil, options: nil)?.first as! EcommerceStyle19Header
        sliderImg.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height/1.8)
        
        sliderImg.imagesArray = ["Ecommerce-19", "Ecommerce-19", "Ecommerce-19", "Ecommerce-19"]
        sliderImg.slider.images = sliderImg.imagesArray
        sliderImg.slider.autoSrcollEnabled = true
        sliderImg.slider.enableArrowIndicator = false
        sliderImg.slider.enablePageIndicator = true
        sliderImg.slider.enableSwipe = true
        sliderImg.slider.allowCircular = false
        
        self.view.addSubview(sliderImg)
        
        // create viewSize
        viewSize = Bundle.main.loadNibNamed("EcommerceStyle19Size", owner: nil, options: nil)?.first as! EcommerceStyle19Size
        viewSize.frame = CGRect(x: 0, y: self.view.frame.size.height-180, width: self.view.frame.size.width, height: 60)
        viewSize.delegate = self
        self.view.addSubview(viewSize)
        
        // create viewOption
        viewOption = Bundle.main.loadNibNamed("EcommerceStyle19Option", owner: nil, options: nil)?.first as! EcommerceStyle19Option
        viewOption.frame = CGRect(x: 0, y: self.view.frame.size.height-120, width: self.view.frame.size.width, height: 60)
        viewOption.delegate = self
        self.view.addSubview(viewOption)
        
        // create viewFooter
        viewFooter = Bundle.main.loadNibNamed("EcommerceStyle19Footer", owner: nil, options: nil)?.first as! EcommerceStyle19Footer
        viewFooter.frame = CGRect(x: 0, y: self.view.frame.size.height-60, width: self.view.frame.size.width, height: 60)
        viewFooter.btnAddCart.setTitle("Add to Cart $255", for: .normal)
        viewFooter.delegate = self
        self.view.addSubview(viewFooter)

    }
    
    // EcommerceStyle15HeaderDelegate
    func menu() {
        navigationController?.popViewController(animated: true)
    }
    
    func search() {
        // not use
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
    
    // EcommerceStyle19SizeDelegate
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
    
    // EcommerceStyle19OptionDelegate
    func color(){
        FunctionDefault.AlertMessage(title: "Color", message: "", targetVC: self)
    }
    func qty(){
        FunctionDefault.AlertMessage(title: "Quantity", message: "", targetVC: self)
    }
    // end
    
    // EcommerceStyle19FooterDelegate
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
