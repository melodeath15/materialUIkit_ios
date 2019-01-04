//
//  ProfileControllerStyle28.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle28: UIViewController, UITableViewDelegate, UITableViewDataSource, ProfileHeaderDelegate , ProfileHeaderCellTyle14Delegate, ProfileCellMenuStyle21Delegate{
    
    var header = ProfileHeader()
    var table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
        
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 241/255.0, green: 246/255.0, blue: 248/255.0, alpha: 1)
        
        // Create headerMenu
        header = Bundle.main.loadNibNamed("ProfileHeader", owner: nil, options: nil)?.first as! ProfileHeader
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Profile"
        header.delegate = self
        self.view .addSubview(header)
        
        // function show or close menu left
        header.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // create table
        table.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = UIColor.clear
        table.separatorColor = UIColor.clear
        table.allowsSelection = false
        
        // register UINib for GalleryStyle1Collection
        table.register(UINib(nibName: "ProfileHeaderCellTyle14", bundle: nil), forCellReuseIdentifier: "ProfileHeaderCellTyle14")
        table.register(UINib(nibName: "ProfileAboutStyle7", bundle: nil), forCellReuseIdentifier: "ProfileAboutStyle7")
        table.register(UINib(nibName: "ProfileCellMenuStyle21", bundle: nil), forCellReuseIdentifier: "ProfileCellMenuStyle21")

        self.view .addSubview(table)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 200
        case 1:
            return 150
        case 2:
            return 200
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileHeaderCellTyle14", for: indexPath)as! ProfileHeaderCellTyle14
            
            cell.name.text = "Michael Angelo"
            cell.city.text = "San Fransisca, CA"
            cell.name.textColor = UIColor.white
            cell.city.textColor = UIColor.white
            
            cell.imgBg.isHidden = false
            cell.imgBg.downloadedFrom(link: "\(baseAssetProfile)Profile-28-header.jpg", contentMode: .scaleAspectFill)
            
            cell.delegate = self
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileAboutStyle7", for: indexPath) as! ProfileAboutStyle7
            cell.deskripsi.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
            cell.value1.text = "www.hendley.com"
            cell.value2.text = "michael-hendley"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCellMenuStyle21", for: indexPath)as! ProfileCellMenuStyle21
            cell.delegate = self
            return cell
        default:
            let cell = UITableViewCell()
            return cell
        }
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
    
    // ProfileHeaderCellTyle14Delegate
    func plush() {
        FunctionDefault.AlertMessage(title: "Plush", message: "", targetVC: self)
    }
    
    func share() {
        FunctionDefault.AlertMessage(title: "Share", message: "", targetVC: self)
    }
    // end
    
    // ProfileCellMenuStyle21Delegate
    func Educ() {
        FunctionDefault.AlertMessage(title: "Education", message: "", targetVC: self)
        
    }
    func expe() {
        FunctionDefault.AlertMessage(title: "Experience", message: "", targetVC: self)
        
    }
    func skil() {
        FunctionDefault.AlertMessage(title: "Skills", message: "", targetVC: self)
        
    }
    func Serv() {
        FunctionDefault.AlertMessage(title: "Services", message: "", targetVC: self)
        
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
