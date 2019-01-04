//
//  ProfileControllerStyle7.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle7: UIViewController, UITableViewDelegate, UITableViewDataSource, ProfileHeaderDelegate, ProfileHeaderStyle7Delegate, ProfileCollectionStyle7Delegate, ProfileCellStyle6Delegate {
    
    var headerMenu = ProfileHeader()
    var header = ProfileHeaderStyle7()
    var tap = ProfileCollectionStyle7()
    var table = UITableView()
    
    var status = Int()
    var img = NSArray()
    var name = NSArray()
    var counter = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img = [
            "\(baseAssetProfile)Profile-6-image1.jpg",
            "\(baseAssetProfile)Profile-6-image2.jpg",
            "\(baseAssetProfile)Profile-6-image3.jpg"
        ]
        
        name = ["Urban Skyscrapers", "Citywalks", "Antique Car"]
        counter = ["19 Photos", "19 Photos", "19 Photos"]
        
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
        header = Bundle.main.loadNibNamed("ProfileHeaderStyle7", owner: nil, options: nil)?.first as! ProfileHeaderStyle7
        header.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 80)
        header.name.text = "Michael Angelo"
        header.title.text = "UI Designer"
        header.delegate = self
        self.view .addSubview(header)
        
        // Create tap
        tap = Bundle.main.loadNibNamed("ProfileCollectionStyle7", owner: nil, options: nil)?.first as! ProfileCollectionStyle7
        tap.frame = CGRect(x: 0, y: 160, width: self.view.frame.size.width, height: 80)
        tap.counterMenu = 3
        tap.active = 0
        status = 0
        tap.data = ["359", "10.289", "4317"]
        tap.title = ["Stories", "Followers", "Followings"]
        tap.delegate = self
        self.view .addSubview(tap)
        
        // Create table
        table.frame = CGRect(x: 0, y: 240, width: self.view.frame.size.width, height: self.view.frame.size.height-240)
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = UIColor.init(red: 241/255.0, green: 246/255.0, blue: 248/255.0, alpha: 1)
        table.separatorColor = UIColor.clear
        table.allowsSelection = false
        
        table.register(UINib(nibName: "ProfileAboutStyle7", bundle: nil), forCellReuseIdentifier: "ProfileAboutStyle7")
        table.register(UINib(nibName: "ProfileCellStyle6", bundle: nil), forCellReuseIdentifier: "ProfileCellStyle6")
        self.view.addSubview(table)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch status {
        case 0:
            return 4
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch status {
        case 0:
            if indexPath.row == 0{
                return 120
            }else{
                return 150
            }
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch status {
        case 0:
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileAboutStyle7", for: indexPath) as! ProfileAboutStyle7
                cell.deskripsi.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
                cell.value1.text = "www.hendley.com"
                cell.value2.text = "michael-hendley"
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCellStyle6", for: indexPath) as! ProfileCellStyle6

                cell.img.downloadedFrom(link: "\(img[indexPath.row-1])", contentMode: .scaleAspectFill)
                cell.title.text = "\(name[indexPath.row-1])"
                cell.counter.text = "\(counter[indexPath.row-1])"
                
                cell.backgroundColor = UIColor.init(red: 241/255.0, green: 246/255.0, blue: 248/255.0, alpha: 1)
                cell.index = indexPath
                cell.delegate = self
                return cell
            }
        default:
            let cell = UITableViewCell()
            return cell
        }
        
    }
    
    // ProfileCellStyle6
    func pushCell(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(index.row-1)", message: "", targetVC: self)
    }
    // end
    
    
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
    
    // ProfileHeaderStyle7Delegate
    func plus() {
        FunctionDefault.AlertMessage(title: "Plush", message: "", targetVC: self)
    }
    // end
    
    // ProfileTapCollectionDelegate
    func activeMenu(index: IndexPath) {
        status = index.row
        table.reloadData()
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
