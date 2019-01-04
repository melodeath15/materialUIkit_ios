//
//  GalleryControllerStyle5.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/21/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle5: UIViewController, GalleryStyle1HeaderDelegate {

    var header = GalleryStyle1Header()
    var viewImg = GalleryStyle5Cell()
    var viewBg = GalleryStyle5Bg()
    var list = NSArray()
    var Name = NSArray()
    var tagName = NSArray()
    
    var swipeView: DMSwipeCardsView<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["\(baseAssetGallery)Gallery-5-img-1.jpg", "\(baseAssetGallery)Gallery-4-img-2.png",""]
        Name = ["Waiting in Woods", "Wallpaper"]
        tagName = ["Wallpaper, Nature, Photography", "Minial Interior"]
        
        createView() // function for create header, create collectionview

        
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // Create Header
        header = Bundle.main.loadNibNamed("GalleryStyle1Header", owner: nil, options: nil)?.first as! GalleryStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Wallpaper"
        header.btnMenu.setImage(UIImage(named: "back1"), for: .normal)
        header.delegate = self
        self.view.addSubview(header)
    
        // Create viewBg
        viewBg = Bundle.main.loadNibNamed("GalleryStyle5Bg", owner: nil, options: nil)?.first as! GalleryStyle5Bg
        viewBg.frame = CGRect(x: 20, y: 100, width: self.view.frame.size.width-40, height: self.view.frame.size.height-200)
        self.view.addSubview(viewBg)

        let viewGenerator: (String, CGRect) -> (UIView) = { (element: String, frame: CGRect) -> (UIView) in
            self.viewImg = Bundle.main.loadNibNamed("GalleryStyle5Cell", owner: nil, options: nil)?.first as! GalleryStyle5Cell
            self.viewImg.frame = CGRect(x: 20, y: 50, width: self.view.frame.size.width-40, height: self.view.frame.size.height-160)

            self.viewImg.img.downloadedFrom(link: "\(self.list[Int(element)!-1])", contentMode: .scaleAspectFill)
            self.viewImg.title.text = "\(self.Name[Int(element)!-1])"
            self.viewImg.des.text = "\(self.tagName[Int(element)!-1])"
            return self.viewImg
        }
        
        let frame = CGRect(x: 0, y: 80, width: self.view.frame.width, height: self.view.frame.height - 160)
        swipeView = DMSwipeCardsView<String>(frame: frame,
                                             viewGenerator: viewGenerator,
                                             overlayGenerator: nil)
        swipeView.delegate = self
        self.view.addSubview(swipeView)
        self.swipeView.addCards((1...(list.count-1)).map({"\($0)"}), onTop: true)

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

extension GalleryControllerStyle5: DMSwipeCardsViewDelegate {
    func swipedLeft(_ object: Any) {
        print("Swiped left: \(object)")
    }
    
    func swipedRight(_ object: Any) {
        print("Swiped right: \(object)")
    }
    
    func cardTapped(_ object: Any) {
        print("Tapped on: \(object)")
    }
    
    func reachedEndOfStack() {
        print("Reached end of stack")
        self.swipeView.addCards((1...(list.count-1)).map({"\($0)"}), onTop: true)
    }
}
