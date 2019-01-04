//
//  GalleryControllerStyle24.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/25/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle24: UIViewController, UITableViewDelegate, UITableViewDataSource, GalleryStyle1HeaderDelegate, GalleryStyle24CellDelegate {
    
    var tableGallery = UITableView()
    var header = GalleryStyle1Header()
    var cell = GalleryStyle24Cell()

    var list = NSArray()
    var name = NSArray()
    var count = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["\(baseAssetGallery)Gallery-24-img-1.png", "\(baseAssetGallery)Gallery-24-img-2.png"]
        name = ["Japanese Cuisine  Ingredients Collections", "World Best Dinning Style"]
        count = ["24", "24"]
        createView()
        
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.black
        
        // create table
        tableGallery.frame = CGRect(x: 0, y: -20, width: self.view.frame.size.width, height: self.view.frame.size.height+20)
        tableGallery.delegate = self;
        tableGallery.dataSource = self;
        tableGallery.backgroundColor = UIColor.clear
        tableGallery.separatorColor = UIColor.clear
        tableGallery.allowsSelection = false
        tableGallery.isScrollEnabled = false
        
        // register UINib for GalleryStyle1Collection
        tableGallery.register(UINib(nibName: "GalleryStyle24Cell", bundle: nil), forCellReuseIdentifier: "GalleryStyle24Cell")
        self.view .addSubview(tableGallery)
        
        // create header
        header = Bundle.main.loadNibNamed("GalleryStyle1Header", owner: nil, options: nil)?.first as! GalleryStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.btnSearch.isHidden = true
        header.btnOptional.isHidden = true
        header.title.text = ""
        header.backgroundColor = UIColor.clear
        
        header.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.addSubview(header)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height/2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell = tableView.dequeueReusableCell(withIdentifier: "GalleryStyle24Cell", for: indexPath)as! GalleryStyle24Cell
        
        cell.img.downloadedFrom(link: "\(list[indexPath.row])", contentMode: .scaleAspectFill)
        cell.title.text = "\(name[indexPath.row])"
        cell.count.text = "\(count[indexPath.row]) Photos"
         
        cell.index = indexPath as NSIndexPath
        cell.delegate = self
        return cell
    }
    
    func shareImg(index: NSIndexPath) {
        FunctionDefault.AlertMessage(title: "Share", message: "\(index.row)", targetVC: self)
    }
    
    // GalleryStyle1HeaderDelegate
    func menu(){
        // not use
    }
    
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
