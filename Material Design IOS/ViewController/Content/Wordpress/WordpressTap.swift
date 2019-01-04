//
//  WordpressTap.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/19/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

class WordpressTap: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMenu()
    }
    
    func createMenu(){
        buttonBarView.backgroundColor = UIColor.init(red: 204/255, green: 16/255, blue: 0/255, alpha: 1)
        buttonBarView.selectedBar.backgroundColor = UIColor.white
        buttonBarView.selectedBarHeight = 2
        
        settings.style.buttonBarItemBackgroundColor = UIColor.init(red: 204/255, green: 16/255, blue: 0/255, alpha: 1)
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 12)
        
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.lightText
            newCell?.label.textColor = UIColor.white
        }
    }
    
    // MARK: - PagerTabStripDataSource
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = WordpressController(itemInfo: "RECENT POSTS")
        let child_2 = WordpressController(itemInfo: "THEMES")
        let child_3 = WordpressController(itemInfo: "SECURITY")
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
