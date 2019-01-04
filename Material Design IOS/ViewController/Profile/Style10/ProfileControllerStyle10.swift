//
//  ProfileControllerStyle10.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle10: UIViewController, IndicatorInfoProvider, ProfileHeaderStyle10Delegate, ProfileFooterStyle10Delegate {
    
    var itemInfo: IndicatorInfo = "PROFILE"
    var bg = ProfileHeaderStyle10()
    var about = ProfileAboutStyle10()
    var footer = ProfileFooterStyle10()

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
        bg = Bundle.main.loadNibNamed("ProfileHeaderStyle10", owner: nil, options: nil)?.first as! ProfileHeaderStyle10
        bg.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        bg.imgBg.downloadedFrom(link: "\(baseAssetProfile)Profile-10-background.jpg", contentMode: .scaleAspectFill)
        
        bg.delegate = self
        self.view .addSubview(bg)
        
        // Create bg
        about = Bundle.main.loadNibNamed("ProfileAboutStyle10", owner: nil, options: nil)?.first as! ProfileAboutStyle10
        about.frame = CGRect(x: 0, y: self.view.frame.size.height-350, width: self.view.frame.size.width, height: 150)
        about.deskripsi.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
        about.value1.text = "www.hendley.com"
        about.value2.text = "michael-hendley"
        self.view .addSubview(about)
        
        // Create footer
        footer = Bundle.main.loadNibNamed("ProfileFooterStyle10", owner: nil, options: nil)?.first as! ProfileFooterStyle10
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-200, width: self.view.frame.size.width, height: 80)
        footer.delegate = self
        self.view .addSubview(footer)
        
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
