//
//  GalleryControllerStyle14View.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/1/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle14View: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        createMenu()
    
    }
    
    func createMenu(){
        buttonBarView.backgroundColor = UIColor.init(red: 151/255.0, green: 201/255.0, blue: 82/255.0, alpha: 1)
        buttonBarView.selectedBar.backgroundColor = UIColor.white
        buttonBarView.selectedBarHeight = 2
        
        settings.style.buttonBarItemBackgroundColor = UIColor.init(red: 151/255.0, green: 201/255.0, blue: 82/255.0, alpha: 1)
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 12)
        
        
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.lightText
            newCell?.label.textColor = UIColor.white
        }
    }
    
    // MARK: - PagerTabStripDataSource
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = GalleryContollerStyle14Tap1(itemInfo: "PHOTO")
        let child_2 = GalleryContollerStyle14Tap1(itemInfo: "VIDEO")
        let child_3 = GalleryContollerStyle14Tap1(itemInfo: "DOCUMENT")
        
        return [child_1, child_2, child_3]
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
