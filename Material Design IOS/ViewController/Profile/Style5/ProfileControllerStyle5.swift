//
//  ProfileControllerStyle5.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ProfileControllerStyle5: UIViewController, ProfileHeaderDelegate, ProfileHeaderStyle5Delegate, ProfileTapCollectionDelegate, CLLocationManagerDelegate {
    
    var headerMenu = ProfileHeader()
    var header = ProfileHeaderStyle5()
    var tap = ProfileTapCollection()
    var map = ProfileMapStyle5()
    
    var status = Int()
    var viewTap = UIView()
    var locationManager = CLLocationManager.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
        
    }
    
    func createView(){
        // Create headerMenu
        headerMenu = Bundle.main.loadNibNamed("ProfileHeader", owner: nil, options: nil)?.first as! ProfileHeader
        headerMenu.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        headerMenu.title.text = "Profile"
        headerMenu.delegate = self
        self.view .addSubview(headerMenu)
        
        // function show or close menu left
        headerMenu.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // Create Header
        header = Bundle.main.loadNibNamed("ProfileHeaderStyle5", owner: nil, options: nil)?.first as! ProfileHeaderStyle5
        header.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 130)
        header.title.text = "Michael Angelo"
        header.delegate = self
        self.view .addSubview(header)
        
        // Create tap
        tap = Bundle.main.loadNibNamed("ProfileTapCollection", owner: nil, options: nil)?.first as! ProfileTapCollection
        tap.frame = CGRect(x: 0, y: 210, width: self.view.frame.size.width, height: 60)
        tap.counterMenu = 3
        tap.active = 0
        status = 0
        tap.data = ["359", "10.289", "4317"]
        tap.title = ["Stories", "Followers", "Followings"]
        tap.delegate = self
        self.view .addSubview(tap)
        
        view1View()
    }
    
    func view1View(){
        // Create a Map
        
        map = Bundle.main.loadNibNamed("ProfileMapStyle5", owner: nil, options: nil)?.first as! ProfileMapStyle5
        map.frame = CGRect(x: 0, y: 270, width: self.view.frame.size.width, height: self.view.frame.size.height-270)
        self.view .addSubview(map)
        
        locationManager.requestWhenInUseAuthorization()
        
        map.map.mapType = .standard
        map.map.showsUserLocation = true
        
    }
    
    // ProfileHeaderDelegate
    func search() {
        FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)
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
    
    // ProfileHeaderStyle5Delegate
    func follow() {
        FunctionDefault.AlertMessage(title: "Follow", message: "", targetVC: self)
    }
    func share() {
        FunctionDefault.AlertMessage(title: "Share", message: "", targetVC: self)
    }
    // end
    
    // ProfileTapCollectionDelegate
    func activeMenu(index: IndexPath) {
        status = index.row
        switch index.row {
        case 0:
            map.isHidden = false
        default:
            map.isHidden = true
        }
    }
    // end
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
