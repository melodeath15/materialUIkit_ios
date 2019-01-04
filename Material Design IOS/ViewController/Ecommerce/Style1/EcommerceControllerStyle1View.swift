//
//  EcommerceControllerStyle1View.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/2/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class EcommerceControllerStyle1View: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createMenu()
    }
    
    func createMenu(){
        buttonBarView.backgroundColor = UIColor.init(red: 250/255.0, green: 164/255.0, blue: 25/255.0, alpha: 1)
        buttonBarView.selectedBar.backgroundColor = UIColor.white
        buttonBarView.selectedBarHeight = 2
        
        settings.style.buttonBarItemBackgroundColor = UIColor.init(red: 250/255.0, green: 164/255.0, blue: 25/255.0, alpha: 1)
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 12)
        
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.lightText
            newCell?.label.textColor = UIColor.white
        }
    }
    
    // MARK: - PagerTabStripDataSource
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = EcommerceControllerStyle1Tap1(itemInfo: "PROMO")
        let child_2 = EcommerceControllerStyle1Tap1(itemInfo: "WOMEN")
        let child_3 = EcommerceControllerStyle1Tap1(itemInfo: "MEN")
        let child_4 = EcommerceControllerStyle1Tap1(itemInfo: "KIDS")
        return [child_1, child_2, child_3, child_4]
    }
    
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
