//
//  TumblController.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/23/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

class TumblController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, HeaderContentDelegate, TumblrCellDelegate, CHTCollectionViewDelegateWaterfallLayout {
    
    var header = HeaderContent()
    var collection: UICollectionView!
    var cell = TumblrCell()
    
    var dataPost = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
        getData()
    
    }
    
    func getData(){
        // change your apikey n playlistId in Tublr developer
        // url Tublr = technigadgets.tumblr.com
        // api_key=57gBN0owYvjhhe0uMnAXin64vnZlHECqgTTXZyxWy7b94WyGyH
        
        let url = URL(string: "https://api.tumblr.com/v2/blog/technigadgets.tumblr.com/posts/photo?api_key=57gBN0owYvjhhe0uMnAXin64vnZlHECqgTTXZyxWy7b94WyGyH&notes_info=true&limit=25")
        let task = URLSession.shared.dataTask(with: url!) { (dataTask, responTask, errorTask) in
            
            if errorTask != nil{
                FunctionDefault.AlertMessage(title: "Error", message: (errorTask?.localizedDescription)!, targetVC: self)
            }else{
                if let urlContent = dataTask{
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        let response = jsonResult["response"] as AnyObject
                        let posts = response["posts"] as! NSMutableArray
                        for i in 0..<posts.count{
                            self.dataPost.add(posts[i])
                        }
                        
                        DispatchQueue.main.async {
                            self.collection.reloadData()
                        }
                        
                    }catch{
                        FunctionDefault.AlertMessage(title: "Error", message: "Json Parsing Failed", targetVC: self)
                    }
                }
            }
        }
        
        task.resume()
        
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.white
        
        // create header
        header = Bundle.main.loadNibNamed("HeaderContent", owner: nil, options: nil)?.first as! HeaderContent
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Tumblr Feed"
        
        header.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.addSubview(header)
        
        let layout = CHTCollectionViewWaterfallLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumColumnSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.columnCount = 2
        
        collection = UICollectionView(frame: CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80), collectionViewLayout: layout)
        collection.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        collection.alwaysBounceVertical = true
        collection.backgroundColor = UIColor.clear
        collection.delegate = self
        collection.dataSource = self
        
        collection.setCollectionViewLayout(layout, animated: true)
        collection.register(UINib(nibName: "TumblrCell", bundle:nil), forCellWithReuseIdentifier: "TumblrCell")
        self.view.addSubview(collection)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataPost.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TumblrCell", for: indexPath) as! TumblrCell
        
        let json = self.dataPost[indexPath.row] as AnyObject
        let photos = json["photos"] as AnyObject
        let counter = photos[0] as AnyObject
        
        let original_size = counter["original_size"] as AnyObject

        cell.img.downloadedFrom(url: URL(string:(original_size["url"] as? String)!)!, contentMode: .scaleAspectFill)
        
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let json = self.dataPost[indexPath.row] as AnyObject
        let photos = json["photos"] as AnyObject
        let counter = photos[0] as AnyObject
        
        let original_size = counter["original_size"] as AnyObject
        
        let url = URL(string:(original_size["url"] as? String)!)!
        if let data = try? Data(contentsOf: url)
        {
            let image: UIImage = UIImage(data: data)!
            let imageSize = image.size
            let w = imageSize.width
            let h = imageSize.height
            
            return CGSize(width: w, height: h)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
    
    
    // TumblrCellDelegate
    func pushCell(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "Message", message: "Push Cell", targetVC: self)
    }
    
    // HeaderContentDelegate
    func menu() {
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
