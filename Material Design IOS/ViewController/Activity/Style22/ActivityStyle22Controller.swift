//
//  ActivityStyle22Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ActivityStyle22Controller: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ViewActivityStyle1HeaderDelegate, CHTCollectionViewDelegateWaterfallLayout, UISearchBarDelegate{
    
    var header = ViewActivityStyle1Header() // var view xib in folder style1 name ViewActivityStyle1Header
    var collMenu: UICollectionView! // var collectionView
    var viewSearchBar = UISearchBar() // var searchBar
    let model = DataDefault() // var data dummy
    var resize = CGFloat() // var reize cell
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.createDataImageProfile2() // create data dummy
        createView() // function for create header, create searchbar, create collectionview
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
        
        // create searchbar
        viewSearchBar.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 50)
        viewSearchBar.barTintColor = UIColor.init(red: 248/255.0, green: 86/255.0, blue: 33/255.0, alpha: 1.0)
        viewSearchBar.delegate = self
        self.view.addSubview(viewSearchBar)
        
        // create collectionview
        let layout = CHTCollectionViewWaterfallLayout()
        layout.minimumColumnSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.columnCount = 2
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        
        collMenu = UICollectionView(frame: CGRect(x: 0, y: 130, width: self.view.frame.size.width, height: self.view.frame.size.height-130), collectionViewLayout: layout)
        collMenu.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        collMenu.alwaysBounceVertical = true
        collMenu.backgroundColor = UIColor.init(red: 243/255, green: 246/255, blue: 249/255, alpha: 1)
        collMenu.delegate = self;
        collMenu.dataSource = self;
        collMenu.alwaysBounceVertical = true
        
        collMenu.collectionViewLayout = layout
        
        // regis UINib ViewActivityStyle22Cell
        collMenu.register(UINib(nibName: "ViewActivityStyle22Cell", bundle:nil), forCellWithReuseIdentifier: "ViewActivityStyle22Cell")
        
        self.view.addSubview(collMenu)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.row {
        case 0:
            resize = 280
        case 1:
            resize = 460
        case 2:
            resize = 170
        case 3:
            resize = 190
        case 4:
            resize = 220
        default:
            break
        }
        
        let newSize = CGSize(width: self.view.frame.size.width, height: 80+resize)
        return newSize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ViewActivityStyle22Cell", for: indexPath) as! ViewActivityStyle22Cell
        
        cell.imgProfile.image = model.dataImageProfile2[indexPath.row]

        switch indexPath.row {
        case 0:
            cell.name.text = "Christina"
            cell.time.text = "17:53"
            cell.des.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque aliquet vehicula mi. Donec vel leo sapien. In ultrices id lorem sollicitudin volutpat"
        case 1:
            cell.name.text = "Remi Boucher"
            cell.time.text = "13:30"
            cell.des.text = " Praesent finibus at est in dictum. Ut imperdiet scelerisque erat, quis varius mi condimentum ac. Sed consequat ut lacus eu sagittis.Praesent finibus at est in dictum. Ut imperdiet scelerisque erat, quis varius mi condimentum ac. Sed consequat ut lacus eu sagittis."
        case 2:
            cell.name.text = "Steve Rogers"
            cell.time.text = "10:17"
            cell.des.text = "Suspendisse blandit, augue eget pretium tincidunt, orci nisi commodo erat."
        case 3:
            cell.name.text = "Ludwig Beethov"
            cell.time.text = "Yesterday"
            cell.des.text = "Cras tortor lorem, placerat at dui congue, molestie interdum augue"
        case 3:
            cell.name.text = "Madelaine"
            cell.time.text = "Yesterday"
            cell.des.text = "Donec vel augue tempor turpis hendrerit aliquam non vitae eros. Donec orci libero, ultrices et sapien et, suscipit suscipit urna."
        case 4:
            cell.time.text = "Yesterday"
            cell.des.text = "Proin interdum magna quis diam vehicula cursus. Ut sit amet nulla sodales augue eleifend lobortis in malesuada urna."
        default:
            break
        }
        
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
        self.present(actionSheet, animated: true, completion: nil)
    }
    // end
    
    // Delegate UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // logic
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // logic
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // logic
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.dataImageProfile2.count
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
