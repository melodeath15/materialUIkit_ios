//
//  GalleryControllerStyle18.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/25/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle18: UIViewController, UITableViewDelegate, UITableViewDataSource, GalleryStyle6HeaderDelegate, GalleryStyle18CellDelegate {
    
    var tableGallery = UITableView()
    var header = GalleryStyle6Header()
    var cell = GalleryStyle18Cell()
    
    var list = NSArray()
    var countSelect = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["\(baseAssetGallery)Gallery-18-img-1.png", "\(baseAssetGallery)Gallery-18-img-2.png", "\(baseAssetGallery)Gallery-18-img-3.png"]
        countSelect = 0
        createView()
        
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create header
        header = Bundle.main.loadNibNamed("GalleryStyle6Header", owner: nil, options: nil)?.first as! GalleryStyle6Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        
        header.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.addSubview(header)
        
        // create table
        tableGallery.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        tableGallery.delegate = self;
        tableGallery.dataSource = self;
        tableGallery.backgroundColor = UIColor.clear
        tableGallery.separatorColor = UIColor.clear
        tableGallery.allowsSelection = false
        
        // register UINib for GalleryStyle1Collection
        tableGallery.register(UINib(nibName: "GalleryStyle18Cell", bundle: nil), forCellReuseIdentifier: "GalleryStyle18Cell")
        self.view .addSubview(tableGallery)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell = tableView.dequeueReusableCell(withIdentifier: "GalleryStyle18Cell", for: indexPath)as! GalleryStyle18Cell
        
        cell.img.downloadedFrom(link: "\(list[indexPath.row])", contentMode: .scaleAspectFill)
        
        cell.delegate = self
        return cell
    }

    func pushCell(count: Int) {
        
        countSelect += count
        
        if countSelect > 0{
            header.title.text = "\(countSelect) Selected"
            header.btmShare.isHidden = false
            header.btnSearch.setImage(UIImage(named: "Gallery-11-icon-delete"), for: .normal)
        }else{
            header.title.text = "Gallery"
            header.btmShare.isHidden = true
            header.btnSearch.setImage(UIImage(named: "search1"), for: .normal)
        }
    
    }
    
    // GalleryStyle6HeaderDelegate
    func menu(){
        // not use
    }
    
    func search() {
        
        if countSelect > 0{
            FunctionDefault.AlertMessage(title: "Delete", message: "", targetVC: self)
        }else{
            FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)
        }
    }
    
    func share() {
        FunctionDefault.AlertMessage(title: "Share", message: "", targetVC: self)
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
