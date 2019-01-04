//
//  ProfileControllerStyle11.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle11: UIViewController, IndicatorInfoProvider, ProfileViewStyle11Delegate, ProfileTapMenuStyle11Delegate {
    
    var itemInfo: IndicatorInfo = "PROFILE"
    var ViewStyle11 = ProfileViewStyle11()
    var tap = ProfileTapMenuStyle11()
    var status = Int()
    
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create bg
        ViewStyle11 = Bundle.main.loadNibNamed("ProfileViewStyle11", owner: nil, options: nil)?.first as! ProfileViewStyle11
        ViewStyle11.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-100)
        ViewStyle11.name.text = "Michael Angelo"
        ViewStyle11.city.text = "Manhattan, NY"
        ViewStyle11.imgBg.downloadedFrom(link: "\(baseAssetProfile)Profile-11-background.jpg", contentMode: .scaleAspectFill)
        ViewStyle11.delegate = self
        self.view .addSubview(ViewStyle11)
        
        // Create tap
        tap = Bundle.main.loadNibNamed("ProfileTapMenuStyle11", owner: nil, options: nil)?.first as! ProfileTapMenuStyle11
        tap.frame = CGRect(x: 16, y: self.view.frame.size.height-240, width: self.view.frame.size.width-32, height: 60)
        tap.counterMenu = 3
        tap.active = 0
        status = 0
        tap.data = ["359", "10.289", "4317"]
        tap.title = ["Photos", "Followers", "Followings"]
        tap.delegate = self
        ViewStyle11 .addSubview(tap)
        
    }
    
    // ProfileHeaderStyle10Delegate
    func email() {
        FunctionDefault.AlertMessage(title: "Email", message: "", targetVC: self)
    }
    
    func setting() {
        FunctionDefault.AlertMessage(title: "Setting", message: "", targetVC: self)
    }
    // end
    
    // ProfileFooterStyle10Delegate
    func followMe() {
        FunctionDefault.AlertMessage(title: "Follow Me", message: "", targetVC: self)
    }
    // end
    
    // ProfileTapMenuStyle11Delegate
    func activeMenu(index: IndexPath) {
        switch index.row {
        case 0:
            FunctionDefault.AlertMessage(title: "\(index.row)", message: "", targetVC: self)
        case 1:
            FunctionDefault.AlertMessage(title: "\(index.row)", message: "", targetVC: self)
        case 2:
            FunctionDefault.AlertMessage(title: "\(index.row)", message: "", targetVC: self)
        default:
            break
        }
    }
    // end
    
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
