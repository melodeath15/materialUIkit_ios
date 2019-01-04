//
//  ActivityStyle7Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ActivityStyle7Controller: UIViewController, ViewActivityStyle1HeaderDelegate {
    
    var header = ViewActivityStyle1Header() // var view xib in folder style1 name ViewActivityStyle1Header
    var materi = ViewActivityStyle7() // var view xib in folder style7 name ViewActivityStyle7

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // function for create header, create materi
    }
    
    func createView(){
        // Create Background
        let imageName = "As7"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        imageView.contentMode = .scaleAspectFill
        self.view.addSubview(imageView)

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
        
        // create materi
        materi = Bundle.main.loadNibNamed("ViewActivityStyle7", owner: nil, options: nil)?.first as! ViewActivityStyle7
        materi.frame = CGRect(x: 0, y: self.view.frame.size.height-230, width: self.view.frame.size.width, height: 230)
        
        let stringMain = "Tony Ramirez Posted a tought"
        let stringColor = "Posted a tought "
        
        let locColor = stringMain.characters.count-stringColor.characters.count
        
        let stringAttributed = NSMutableAttributedString.init(string: "Tony Ramirez Posted a tought")
        stringAttributed.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSRange.init(location: locColor, length: stringColor.characters.count))
        
        materi.name?.attributedText = stringAttributed
        
        materi.imgProfile.image = #imageLiteral(resourceName: "profile2")
        materi.time.text = "An hour ago"
        materi.des.text = "Weasel the jeeper goodness inconsiderately spelled so ubiquitous amused knitted and alturuistic"
        materi.valueLove.text = "1347"
        materi.valueView.text = "19789"
        
        
        materi.backgroundColor = UIColor.clear
        self.view.addSubview(materi)

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
