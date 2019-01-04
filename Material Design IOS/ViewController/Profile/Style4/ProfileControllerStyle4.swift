//
//  ProfileControllerStyle4.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 10/31/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ProfileControllerStyle4: UIViewController, UITableViewDelegate, UITableViewDataSource, ProfileHeaderDelegate, ProfileTapCollectionDelegate, ProfileStyle3CellDelegate, ProfileFooterStyle3Delegate {
    
    var headerMenu = ProfileHeader()
    var header = ProfileHeaderStyle4()
    var tap = ProfileTapCollection()
    var footer = ProfileFooterStyle3()
    var table = UITableView()
    
    var status = Int()
    var img = NSArray()
    var name =  NSArray()
    var city = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img = [
            "\(baseAssetProfile)Profile-2-friend1.png",
            "\(baseAssetProfile)Profile-2-friend2.png",
            "\(baseAssetProfile)Profile-2-friend3.png",
            "\(baseAssetProfile)Profile-2-friend4.png",
            "\(baseAssetProfile)Profile-2-friend5.png"
        ]
        
        name = ["Michella Hendly", "Kimberly White", "Steven Rogers", "Amy Pattersson", "Hannah Paige"]
        city = ["San Fransisco, CA", "Manhattan, NY", "Brookly, NY", "Little Indian, ABQ", "San Fransisco, CA"]
        
        createView()
    }
    
    func createView(){
        
        // Create headerMenu
        headerMenu = Bundle.main.loadNibNamed("ProfileHeader", owner: nil, options: nil)?.first as! ProfileHeader
        headerMenu.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        headerMenu.title.text = "Profile"
        headerMenu.delegate = self
        self.view .addSubview(headerMenu)
        
        // Create Header
        header = Bundle.main.loadNibNamed("ProfileHeaderStyle4", owner: nil, options: nil)?.first as! ProfileHeaderStyle4
        header.frame = CGRect(x: 0, y: 70, width: self.view.frame.size.width, height: 190)
        header.name.text = "Michael Angelo"
        header.jabatan.text = "UI Designer"
        header.deskripsi.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged"
        self.view .addSubview(header)
        
        // function show or close menu left
        headerMenu.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // Create tap
        tap = Bundle.main.loadNibNamed("ProfileTapCollection", owner: nil, options: nil)?.first as! ProfileTapCollection
        tap.frame = CGRect(x: 0, y: 230, width: self.view.frame.size.width, height: 60)
        tap.counterMenu = 3
        tap.active = 1
        status = 1
        tap.data = ["359", "10.289", "4317"]
        tap.title = ["Photos", "Followers", "Followings"]
        tap.delegate = self
        self.view .addSubview(tap)
        
        // Create table
        table.frame = CGRect(x: 0, y: 290, width: self.view.frame.size.width, height: self.view.frame.size.height-290-70)
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = UIColor.clear
        table.separatorColor = UIColor.groupTableViewBackground
        table.allowsSelection = false
        table.register(UINib(nibName: "ProfileStyle3Cell", bundle: nil), forCellReuseIdentifier: "ProfileStyle3Cell")
        self.view.addSubview(table)
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("ProfileFooterStyle3", owner: nil, options: nil)?.first as! ProfileFooterStyle3
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-70, width: self.view.frame.size.width, height: 70)
        footer.btnFollow.setTitle("Follow Me", for: .normal)
        footer.delegate = self
        self.view .addSubview(footer)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch status {
        case 1:
            return img.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch status {
        case 1:
            return 70
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileStyle3Cell", for: indexPath) as! ProfileStyle3Cell
        
        switch status {
        case 1:
            cell.title.text = "\(name[indexPath.row])"
            cell.city.text = "\(city[indexPath.row])"
            cell.img.downloadedFrom(link: "\(img[indexPath.row])", contentMode: .scaleAspectFill)
            cell.index = indexPath
        default:
            break
        }
        
        cell.backgroundColor = UIColor.init(red: 241/255.0, green: 246/255.0, blue: 248/255.0, alpha: 1)
        cell.delegate = self
        return cell
    }
    
    // ProfileStyle3CellDelegate
    func pushCell(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(index.row)", message: "", targetVC: self)
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
    
    // ProfileTapCollectionDelegate
    func activeMenu(index: IndexPath) {
        status = index.row
        table.reloadData()
    }
    // end
    
    // ProfileFooterStyle3Delegate
    func Follow() {
        FunctionDefault.AlertMessage(title: "Follow Me", message: "", targetVC: self)
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
