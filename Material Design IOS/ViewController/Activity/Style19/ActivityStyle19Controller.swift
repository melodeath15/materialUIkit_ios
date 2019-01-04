//
//  ActivityStyle19Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ActivityStyle19Controller: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ViewActivityStyle1HeaderDelegate, CHTCollectionViewDelegateWaterfallLayout {
    
    var header = ViewActivityStyle1Header() // var view xib in folder style1 name ViewActivityStyle1Header
    var collMenu: UICollectionView! // var collectionView
    let model = DataDefault() // var data dummy
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.createDataImageBg2() // create data dummy
        model.createDataImageProfile() // create data dummy
        createView() // function for create header, create collectionview
    }
    
    func createView(){
        
        // Create Header
        header = Bundle.main.loadNibNamed("ViewActivityStyle1Header", owner: nil, options: nil)?.first as! ViewActivityStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.iconBack.setImage(UIImage(named: "menu1"), for: .normal)
        header.btnWrite.isHidden = true
        
        // function show or close menu left
        header.iconBack.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        self.view.addSubview(header)
        
        // create collectionview
        let layout = CHTCollectionViewWaterfallLayout()
        layout.minimumColumnSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.columnCount = 2
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        collMenu = UICollectionView(frame: CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80), collectionViewLayout: layout)
        collMenu.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        collMenu.alwaysBounceVertical = true
        collMenu.backgroundColor = UIColor.white
        collMenu.delegate = self;
        collMenu.dataSource = self;
        collMenu.alwaysBounceVertical = true
        
        collMenu.collectionViewLayout = layout
        
        // regis UINib ViewActivityStyle19Cell
        collMenu.register(UINib(nibName: "ViewActivityStyle19Cell", bundle:nil), forCellWithReuseIdentifier: "ViewActivityStyle19Cell")
        
        self.view.addSubview(collMenu)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.dataImageBg2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let imageSize = model.dataImageBg2[indexPath.row].size
        
        let newSize = CGSize(width: imageSize.width, height: imageSize.height + 250)
        return newSize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ViewActivityStyle19Cell", for: indexPath) as! ViewActivityStyle19Cell
        
        cell.imgCell.image = model.dataImageBg2[indexPath.row]
        cell.imgProfile.image = model.dataImageProfile[indexPath.row]
        
        switch indexPath.row {
        case 0:
            cell.name.text = "Christina"
            cell.time.text = "1 hour"
        case 1:
            cell.name.text = "Tony Ramirez"
            cell.time.text = "20:00"
        case 2:
            cell.name.text = "Gabriella Madelaine"
            cell.time.text = "14.30"
        case 3:
            cell.name.text = "Remi Boucher"
            cell.time.text = "14.30"
        default:
            break
        }
        
        cell.valueLove.text = "1347"
        cell.valueComment.text = "19"
        
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    // ViewActivityStyle1HeaderDelegate
    func MenuOrBack() { // function for back layout
        // function hidden for left menu
    }
    
    func Write() { // function for write
        FunctionDefault.AlertMessage(title: "Write", message: "", targetVC: self)
    }
    
    func Search() { // function for search
        FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)
    }
    
    func Option() { // function for menu option
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
        self.present(actionSheet, animated: true, completion: nil)    }
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
