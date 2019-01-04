//
//  GalleryControllerStyle15Tap1.swift
//  Material Design IOS
//
//  Created by Denis TIrta Prada on 8/1/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class GalleryControllerStyle15Tap1: UIViewController, IndicatorInfoProvider, GalleryStyle10ViewDelegate {
    
    var itemInfo: IndicatorInfo = "View"
    var viewImg = GalleryStyle10View()
    var listImage = NSArray()
    var name = NSArray()
    
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        listImage = [
            "\(baseAssetGallery)Gallery-9-img-2.png",
            "\(baseAssetGallery)Gallery-10-img-1.png",
            "\(baseAssetGallery)Gallery-9-img-3.png",
            "\(baseAssetGallery)Gallery-9-img-4.png"
        ]
        
        name = ["Citywalks", "Wooden Cabin Room", "Nature", "Mountain"]
        
        createView() // function for create header, create collectionview
    }
    
    func createView(){
        // Create ViewImg
        viewImg = Bundle.main.loadNibNamed("GalleryStyle10View", owner: nil, options: nil)?.first as! GalleryStyle10View
        viewImg.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-120)
        viewImg.title.text = "Minimal Interior"
        viewImg.count.text = "\(listImage.count) Photos"
        viewImg.titleImg.text = "\(name[0])"
        viewImg.pageImg.text = "1 of \(listImage.count)"
        viewImg.data = listImage
        
        viewImg.collImg.register(UINib(nibName: "GalleryStyle10Cell", bundle: nil), forCellWithReuseIdentifier: "GalleryStyle10Cell")
        viewImg.collImg.contentInset = UIEdgeInsetsMake(10, 30, 10, 30)
        viewImg.collImg.decelerationRate = UIScrollViewDecelerationRateFast
        
        viewImg.delegate = self
        self.view.addSubview(viewImg)
        
    }
    
    // GalleryStyle10ViewDelegate
    func didSelectImg(index: NSIndexPath, data: NSArray) {
        FunctionDefault.AlertMessage(title: "Push Index = \(index.row)", message: "\(data[index.row])", targetVC: self)
    }
    
    func showImg(index: Int, data: NSArray) {
        viewImg.titleImg.text = "\(name[index])"
        viewImg.pageImg.text = "\(index+1) of \(listImage.count)"
    }
    // end
    
    // IndicatorInfoProvider
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
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
