//
//  EcommerceControllerStyle7Tap1.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/3/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle7Tap1: UIViewController, IndicatorInfoProvider, EcommerceStyle7FooterDelegate {

    var itemInfo: IndicatorInfo = "View"
    var viewImg = EcommerceStyle7View()
    var viewBg = EcommerceStyle7Bg()
    var footer = EcommerceStyle7Footer()
    
    var swipeView: DMSwipeCardsView<String>!
    
    var listImg = NSArray()
    var listName = NSArray()
    
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listImg = ["Ecommerce-7", "Ecommerce-3-img-3", "Ecommerce-3-img-4", "Ecommerce-3-img-5"]
        listName = ["Sky Blue Dress", "Zara Jumpsuit Dress", "Black Faux Leather", "Sky Blue Dress Old"]
        createView()
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // Create footer
        footer = Bundle.main.loadNibNamed("EcommerceStyle7Footer", owner: nil, options: nil)?.first as! EcommerceStyle7Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-170, width: self.view.frame.size.width, height: 50)
        footer.delegate = self
        self.view.addSubview(footer)
        
        // Create viewBg
        viewBg = Bundle.main.loadNibNamed("EcommerceStyle7Bg", owner: nil, options: nil)?.first as! EcommerceStyle7Bg
        viewBg.frame = CGRect(x: 22, y: 15, width: self.view.frame.size.width-44, height: self.view.frame.size.height-190)
        self.view.addSubview(viewBg)
        
        // create view
        let viewGenerator: (String, CGRect) -> (UIView) = { (element: String, frame: CGRect) -> (UIView) in
            self.viewImg = Bundle.main.loadNibNamed("EcommerceStyle7View", owner: nil, options: nil)?.first as! EcommerceStyle7View
            self.viewImg.frame = CGRect(x: 20, y: 5, width: UIScreen.main.bounds.size.width-40, height: UIScreen.main.bounds.size.height-210)
            
            self.viewImg.img.image = UIImage(named: "\(self.listImg[Int(element)!-1])")
            self.viewImg.title.text = "\(self.listName[Int(element)!-1])"
            self.viewImg.des.text = "Dress"
            
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "$255")
            attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
            self.viewImg.valueOld.attributedText = attributeString
            
            self.viewImg.valueNew.text = "$125"
            return self.viewImg
        }
        
        let frame = CGRect(x: 0, y: 5, width: self.view.frame.width, height: self.view.frame.height-210)
        swipeView = DMSwipeCardsView<String>(frame: frame,
                                             viewGenerator: viewGenerator,
                                             overlayGenerator: nil)
        swipeView.delegate = self
        self.view.addSubview(swipeView)
        self.swipeView.addCards((1...(listImg.count)).map({"\($0)"}), onTop: true)
        
    }
    
    // EcommerceStyle7FooterDelegate
    func buyNow() {
        FunctionDefault.AlertMessage(title: "Buy Now", message: "", targetVC: self)
    }
    
    func addCart() {
        FunctionDefault.AlertMessage(title: "Add Cart", message: "", targetVC: self)
    }
    //end
    
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

extension EcommerceControllerStyle7Tap1: DMSwipeCardsViewDelegate {
    func swipedLeft(_ object: Any) {
        print("Swiped left: \(object)")
    }
    
    func swipedRight(_ object: Any) {
        print("Swiped right: \(object)")
    }
    
    func cardTapped(_ object: Any) {
        print("Tapped on: \(object)")
    }
    
    func reachedEndOfStack() {
        print("Reached end of stack")
        self.swipeView.addCards((1...(listImg.count)).map({"\($0)"}), onTop: true)
    }
}

