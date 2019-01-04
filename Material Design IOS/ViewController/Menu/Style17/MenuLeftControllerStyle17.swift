//
//  MenuLeftControllerStyle17.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/17/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MenuLeftControllerStyle17: UIViewController, MenuStyle17Delegate {

    private var tableMenu: UITableView = UITableView() // var tableView
    var viewProfile = MenuStyle16Header() // var view xib in folder menu style16 name MenuStyle16Header
    var viewMenu = MenuStyle17() // var view xib in folder menu style17 name MenuStyle17
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // creater searchbar, footer, create table and regis UINib
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create MenuStyle16Header
        viewProfile = Bundle.main.loadNibNamed("MenuStyle16Header", owner: nil, options: nil)?.first as! MenuStyle16Header
        viewProfile.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 140)
        viewProfile.name.text = "Michael Angelo"
        viewProfile.city.text = "Manhattan, NY"
        viewProfile.valueNotif.text = "2"
        self.view.addSubview(viewProfile)
        
        // create MenuStyle17
        viewMenu = Bundle.main.loadNibNamed("MenuStyle17", owner: nil, options: nil)?.first as! MenuStyle17
        viewMenu.frame = CGRect(x: 0, y: 150, width: self.view.frame.size.width, height: 150)
        viewMenu.delegate = self
        self.view.addSubview(viewMenu)
        
    }
    
    // MenuStyle17Delegate
    func dashboard() {
        viewMenu.btnDashboard.backgroundColor = UIColor.init(red: 53/255.0, green: 145/255.0, blue: 250/255.0, alpha: 1)
        viewMenu.btnDashboard.setImage(UIImage(named: "iconDashboardWhite"), for: .normal)
    
        viewMenu.btnExplore.backgroundColor = UIColor.white
        viewMenu.btnExplore.setImage(UIImage(named: "iconExploreGray"), for: .normal)
        
        viewMenu.btnImage.backgroundColor = UIColor.white
        viewMenu.btnImage.setImage(UIImage(named: "iconPhotoGray"), for: .normal)
        
        viewMenu.btnVideo.backgroundColor = UIColor.white
        viewMenu.btnVideo.setImage(UIImage(named: "iconVideoGray"), for: .normal)
        
        viewMenu.btnFriend.backgroundColor = UIColor.white
        viewMenu.btnFriend.setImage(UIImage(named: "iconGroupGray"), for: .normal)
        
        viewMenu.btnMessage.backgroundColor = UIColor.white
        viewMenu.btnMessage.setImage(UIImage(named: "iconMessageGray"), for: .normal)
        
        viewMenu.btnProfile.backgroundColor = UIColor.white
        viewMenu.btnProfile.setImage(UIImage(named: "iconProfileGray"), for: .normal)
        
        viewMenu.btnSetting.backgroundColor = UIColor.white
        viewMenu.btnSetting.setImage(UIImage(named: "iconSettingGray"), for: .normal)
        
        FunctionDefault.AlertMessageAction(title: "Dashboard", message: "", targetVC: self)
    }
    
    func explore() {
        viewMenu.btnDashboard.backgroundColor = UIColor.white
        viewMenu.btnDashboard.setImage(UIImage(named: "iconDashboardGray"), for: .normal)
        
        viewMenu.btnExplore.backgroundColor = UIColor.init(red: 53/255.0, green: 145/255.0, blue: 250/255.0, alpha: 1)
        viewMenu.btnExplore.setImage(UIImage(named: "iconExploreWhite"), for: .normal)
        
        viewMenu.btnImage.backgroundColor = UIColor.white
        viewMenu.btnImage.setImage(UIImage(named: "iconPhotoGray"), for: .normal)
        
        viewMenu.btnVideo.backgroundColor = UIColor.white
        viewMenu.btnVideo.setImage(UIImage(named: "iconVideoGray"), for: .normal)
        
        viewMenu.btnFriend.backgroundColor = UIColor.white
        viewMenu.btnFriend.setImage(UIImage(named: "iconGroupGray"), for: .normal)
        
        viewMenu.btnMessage.backgroundColor = UIColor.white
        viewMenu.btnMessage.setImage(UIImage(named: "iconMessageGray"), for: .normal)
        
        viewMenu.btnProfile.backgroundColor = UIColor.white
        viewMenu.btnProfile.setImage(UIImage(named: "iconProfileGray"), for: .normal)
        
        viewMenu.btnSetting.backgroundColor = UIColor.white
        viewMenu.btnSetting.setImage(UIImage(named: "iconSettingGray"), for: .normal)
        
        FunctionDefault.AlertMessageAction(title: "Explore", message: "", targetVC: self)
    }
    
    func video() {
        viewMenu.btnDashboard.backgroundColor = UIColor.white
        viewMenu.btnDashboard.setImage(UIImage(named: "iconDashboardGray"), for: .normal)
        
        viewMenu.btnExplore.backgroundColor = UIColor.white
        viewMenu.btnExplore.setImage(UIImage(named: "iconExploreGray"), for: .normal)
        
        viewMenu.btnImage.backgroundColor = UIColor.white
        viewMenu.btnImage.setImage(UIImage(named: "iconPhotoGray"), for: .normal)
        
        viewMenu.btnVideo.backgroundColor = UIColor.init(red: 53/255.0, green: 145/255.0, blue: 250/255.0, alpha: 1)
        viewMenu.btnVideo.setImage(UIImage(named: "iconVideos"), for: .normal)
        
        viewMenu.btnFriend.backgroundColor = UIColor.white
        viewMenu.btnFriend.setImage(UIImage(named: "iconGroupGray"), for: .normal)
        
        viewMenu.btnMessage.backgroundColor = UIColor.white
        viewMenu.btnMessage.setImage(UIImage(named: "iconMessageGray"), for: .normal)
        
        viewMenu.btnProfile.backgroundColor = UIColor.white
        viewMenu.btnProfile.setImage(UIImage(named: "iconProfileGray"), for: .normal)
        
        viewMenu.btnSetting.backgroundColor = UIColor.white
        viewMenu.btnSetting.setImage(UIImage(named: "iconSettingGray"), for: .normal)
        
        FunctionDefault.AlertMessageAction(title: "Video", message: "", targetVC: self)
    }
    
    func friend() {
        viewMenu.btnDashboard.backgroundColor = UIColor.white
        viewMenu.btnDashboard.setImage(UIImage(named: "iconDashboardGray"), for: .normal)
        
        viewMenu.btnExplore.backgroundColor = UIColor.white
        viewMenu.btnExplore.setImage(UIImage(named: "iconExploreGray"), for: .normal)
        
        viewMenu.btnImage.backgroundColor = UIColor.white
        viewMenu.btnImage.setImage(UIImage(named: "iconPhotoGray"), for: .normal)
        
        viewMenu.btnVideo.backgroundColor = UIColor.white
        viewMenu.btnVideo.setImage(UIImage(named: "iconVideoGray"), for: .normal)
        
        viewMenu.btnFriend.backgroundColor = UIColor.init(red: 53/255.0, green: 145/255.0, blue: 250/255.0, alpha: 1)
        viewMenu.btnFriend.setImage(UIImage(named: "iconGroup"), for: .normal)
        
        viewMenu.btnMessage.backgroundColor = UIColor.white
        viewMenu.btnMessage.setImage(UIImage(named: "iconMessageGray"), for: .normal)
        
        viewMenu.btnProfile.backgroundColor = UIColor.white
        viewMenu.btnProfile.setImage(UIImage(named: "iconProfileGray"), for: .normal)
        
        viewMenu.btnSetting.backgroundColor = UIColor.white
        viewMenu.btnSetting.setImage(UIImage(named: "iconSettingGray"), for: .normal)
        
        FunctionDefault.AlertMessageAction(title: "Friends", message: "", targetVC: self)
    }
    
    func message() {
        viewMenu.btnDashboard.backgroundColor = UIColor.white
        viewMenu.btnDashboard.setImage(UIImage(named: "iconDashboardGray"), for: .normal)
        
        viewMenu.btnExplore.backgroundColor = UIColor.white
        viewMenu.btnExplore.setImage(UIImage(named: "iconExploreGray"), for: .normal)
        
        viewMenu.btnImage.backgroundColor = UIColor.white
        viewMenu.btnImage.setImage(UIImage(named: "iconPhotoGray"), for: .normal)
        
        viewMenu.btnVideo.backgroundColor = UIColor.white
        viewMenu.btnVideo.setImage(UIImage(named: "iconVideoGray"), for: .normal)
        
        viewMenu.btnFriend.backgroundColor = UIColor.white
        viewMenu.btnFriend.setImage(UIImage(named: "iconGroupGray"), for: .normal)
        
        viewMenu.btnMessage.backgroundColor = UIColor.init(red: 53/255.0, green: 145/255.0, blue: 250/255.0, alpha: 1)
        viewMenu.btnMessage.setImage(UIImage(named: "iconMessage"), for: .normal)
        
        viewMenu.btnProfile.backgroundColor = UIColor.white
        viewMenu.btnProfile.setImage(UIImage(named: "iconProfileGray"), for: .normal)
        
        viewMenu.btnSetting.backgroundColor = UIColor.white
        viewMenu.btnSetting.setImage(UIImage(named: "iconSettingGray"), for: .normal)
        
        FunctionDefault.AlertMessageAction(title: "Messages", message: "", targetVC: self)
    }
    
    func profile() {
        viewMenu.btnDashboard.backgroundColor = UIColor.white
        viewMenu.btnDashboard.setImage(UIImage(named: "iconDashboardGray"), for: .normal)
        
        viewMenu.btnExplore.backgroundColor = UIColor.white
        viewMenu.btnExplore.setImage(UIImage(named: "iconExploreGray"), for: .normal)
        
        viewMenu.btnImage.backgroundColor = UIColor.white
        viewMenu.btnImage.setImage(UIImage(named: "iconPhotoGray"), for: .normal)
        
        viewMenu.btnVideo.backgroundColor = UIColor.white
        viewMenu.btnVideo.setImage(UIImage(named: "iconVideoGray"), for: .normal)
        
        viewMenu.btnFriend.backgroundColor = UIColor.white
        viewMenu.btnFriend.setImage(UIImage(named: "iconGroupGray"), for: .normal)
        
        viewMenu.btnMessage.backgroundColor = UIColor.white
        viewMenu.btnMessage.setImage(UIImage(named: "iconMessageGray"), for: .normal)
        
        viewMenu.btnProfile.backgroundColor = UIColor.init(red: 53/255.0, green: 145/255.0, blue: 250/255.0, alpha: 1)
        viewMenu.btnProfile.setImage(UIImage(named: "iconProfile"), for: .normal)
        
        viewMenu.btnSetting.backgroundColor = UIColor.white
        viewMenu.btnSetting.setImage(UIImage(named: "iconSettingGray"), for: .normal)
        
        FunctionDefault.AlertMessageAction(title: "Profile", message: "", targetVC: self)
    }
    
    func setting() {
        viewMenu.btnDashboard.setImage(UIImage(named: ""), for: .normal)

        viewMenu.btnDashboard.backgroundColor = UIColor.white
        viewMenu.btnDashboard.setImage(UIImage(named: "iconDashboardGray"), for: .normal)
        
        viewMenu.btnExplore.backgroundColor = UIColor.white
        viewMenu.btnExplore.setImage(UIImage(named: "iconExploreGray"), for: .normal)
        
        viewMenu.btnImage.backgroundColor = UIColor.white
        viewMenu.btnImage.setImage(UIImage(named: "iconPhotoGray"), for: .normal)
        
        viewMenu.btnVideo.backgroundColor = UIColor.white
        viewMenu.btnVideo.setImage(UIImage(named: "iconVideoGray"), for: .normal)
        
        viewMenu.btnFriend.backgroundColor = UIColor.white
        viewMenu.btnFriend.setImage(UIImage(named: "iconGroupGray"), for: .normal)
        
        viewMenu.btnMessage.backgroundColor = UIColor.white
        viewMenu.btnMessage.setImage(UIImage(named: "iconMessageGray"), for: .normal)
        
        viewMenu.btnProfile.backgroundColor = UIColor.white
        viewMenu.btnProfile.setImage(UIImage(named: "iconProfileGray"), for: .normal)
        
        viewMenu.btnSetting.backgroundColor = UIColor.init(red: 53/255.0, green: 145/255.0, blue: 250/255.0, alpha: 1)
        viewMenu.btnSetting.setImage(UIImage(named: "iconSettingPutih"), for: .normal)
        
        FunctionDefault.AlertMessageAction(title: "Setting", message: "", targetVC: self)
    }
    
    func image() {
        viewMenu.btnDashboard.setImage(UIImage(named: ""), for: .normal)
        
        viewMenu.btnDashboard.backgroundColor = UIColor.white
        viewMenu.btnDashboard.setImage(UIImage(named: "iconDashboardGray"), for: .normal)
        
        viewMenu.btnExplore.backgroundColor = UIColor.white
        viewMenu.btnExplore.setImage(UIImage(named: "iconExploreGray"), for: .normal)
        
        viewMenu.btnImage.backgroundColor = UIColor.init(red: 53/255.0, green: 145/255.0, blue: 250/255.0, alpha: 1)
        viewMenu.btnImage.setImage(UIImage(named: "iconPhotos"), for: .normal)
        
        viewMenu.btnVideo.backgroundColor = UIColor.white
        viewMenu.btnVideo.setImage(UIImage(named: "iconVideoGray"), for: .normal)
        
        viewMenu.btnFriend.backgroundColor = UIColor.white
        viewMenu.btnFriend.setImage(UIImage(named: "iconGroupGray"), for: .normal)
        
        viewMenu.btnMessage.backgroundColor = UIColor.white
        viewMenu.btnMessage.setImage(UIImage(named: "iconMessageGray"), for: .normal)
        
        viewMenu.btnProfile.backgroundColor = UIColor.white
        viewMenu.btnProfile.setImage(UIImage(named: "iconProfileGray"), for: .normal)
        
        viewMenu.btnSetting.backgroundColor = UIColor.white
        viewMenu.btnSetting.setImage(UIImage(named: "iconSettingGray"), for: .normal)
        
        FunctionDefault.AlertMessageAction(title: "Photo", message: "", targetVC: self)
    }
    // end
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent // return for status bar lightcontent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
