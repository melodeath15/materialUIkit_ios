//
//  GalleryControllerStyle9.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle9: UIViewController, GalleryStyle1HeaderDelegate, UITableViewDelegate, UITableViewDataSource {

    var header = GalleryStyle1Header()
    var tableGallery = UITableView()
    var listImage = NSArray()
    var listName = NSArray()
    var listCount = NSArray()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listImage = ["\(baseAssetGallery)Gallery-9-img-1.png", "\(baseAssetGallery)Gallery-9-img-2.png", "\(baseAssetGallery)Gallery-9-img-3.png", "\(baseAssetGallery)Gallery-9-img-4.png"]
        listName = ["Urban Skyscrapers", "Citywalks", "Nature", "Mountain"]
        listCount = ["19", "19", "19", "19"]
        
        createView() // function for create header, create collectionview
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // Create Header
        header = Bundle.main.loadNibNamed("GalleryStyle1Header", owner: nil, options: nil)?.first as! GalleryStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Gallery"
        
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
        tableGallery.allowsSelection = true
        
        // register UINib for GalleryStyle1Collection
        tableGallery.register(UINib(nibName: "GalleryStyle9Cell", bundle: nil), forCellReuseIdentifier: "GalleryStyle9Cell")
        self.view .addSubview(tableGallery)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listImage.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GalleryStyle9Cell", for: indexPath)as! GalleryStyle9Cell
        cell.img.downloadedFrom(link: "\(listImage[indexPath.row])", contentMode: .scaleAspectFill)
        cell.title.text = listName[indexPath.row] as? String
        cell.total.text = "\(listCount[indexPath.row]) Photos"
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        FunctionDefault.AlertMessage(title: "\(listName[indexPath.row])", message: "", targetVC: self)
    }
    
    // ViewActivityStyle1HeaderDelegate
    func menu() {// function for back layout
        navigationController?.popViewController(animated: true)
    }
    
    func search() {// function for search
        FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)
    }
    
    func optional() {// function for menu option
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
