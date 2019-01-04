//
//  EcommerceControllerStyle16.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/7/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle16: UIViewController, EcommerceStyle1HeaderDelegate,EcommerceStyle14FooterDelegate {
    
    var header = EcommerceStyle1Header()
    var imgSlide = EcommerceStyle16Header()
    var viewDes = EcommerceStyle16View()
    var footer = EcommerceStyle14Footer()
    
    var sizeCell = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

        // create imgSlide
        imgSlide = Bundle.main.loadNibNamed("EcommerceStyle16Header", owner: nil, options: nil)?.first as! EcommerceStyle16Header
        imgSlide.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height/1.8)
        
        imgSlide.imagesArray = ["Ecommerce-16", "Ecommerce-16", "Ecommerce-16", "Ecommerce-16"]
        imgSlide.slider.images = imgSlide.imagesArray
        imgSlide.slider.autoSrcollEnabled = true
        imgSlide.slider.enableArrowIndicator = false
        imgSlide.slider.enablePageIndicator = true
        imgSlide.slider.enableSwipe = true
        imgSlide.slider.allowCircular = false
        
        self.view.addSubview(imgSlide)
        
        // create viewDes
        viewDes = Bundle.main.loadNibNamed("EcommerceStyle16View", owner: nil, options: nil)?.first as! EcommerceStyle16View
        viewDes.frame = CGRect(x: 0, y: self.view.frame.size.height-180, width: self.view.frame.size.width, height: 60)
        
        viewDes.title.text = "Black Faux Leather"
        viewDes.price.text = "$225"
        viewDes.tagTitle.text = "Women, Dress, Summers"
        
        viewDes.backgroundColor = UIColor.white
        self.view.addSubview(viewDes)
        
        // create header
        footer = Bundle.main.loadNibNamed("EcommerceStyle14Footer", owner: nil, options: nil)?.first as! EcommerceStyle14Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-120, width: self.view.frame.size.width, height: 120)
        footer.btnAddCart.setTitle("Add to Cart", for: .normal)
        footer.btnAddCart.setImage(UIImage(named:""), for: .normal)
        footer.backgroundColor = UIColor.white
        footer.delegate = self
        self.view.addSubview(footer)
        
    }
    
    // EcommerceStyle1HeaderDelegate
    func menu() {
        navigationController?.popViewController(animated: true)
    }
    
    func buy(){
        FunctionDefault.AlertMessage(title: "Buy", message: "", targetVC: self)
    }
    // end
    
    // EcommerceStyle14FooterDelegate
    func size(){
        FunctionDefault.AlertMessage(title: "Size", message: "", targetVC: self)
    }
    
    func qty(){
        FunctionDefault.AlertMessage(title: "Quantity", message: "", targetVC: self)
    }
    
    func addCart(){
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
