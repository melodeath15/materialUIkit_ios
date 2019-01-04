//
//  ProfileTapMenuControllerStyle10.swift
//  Material Design IOS
//
//  Created by yanuar prisantoso on 11/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileTapMenuControllerStyle10: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createMenu()
    }
    
    func createMenu(){
        buttonBarView.backgroundColor = UIColor.init(red: 141/255.0, green: 40/255.0, blue: 170/255.0, alpha: 1)
        buttonBarView.selectedBar.backgroundColor = UIColor.white
        buttonBarView.selectedBarHeight = 2
        
        settings.style.buttonBarItemBackgroundColor = UIColor.init(red: 141/255.0, green: 40/255.0, blue: 170/255.0, alpha: 1)
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 12)
        
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.lightText
            newCell?.label.textColor = UIColor.white
        }
    }
    
    // MARK: - PagerTabStripDataSource
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = ProfileControllerStyle10(itemInfo: "PROFILE")
        let child_2 = ProfileControllerStyle10(itemInfo: "PHOTO")
        let child_3 = ProfileControllerStyle10(itemInfo: "FRIENDS")
        let child_4 = ProfileControllerStyle10(itemInfo: "STORIES")
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
