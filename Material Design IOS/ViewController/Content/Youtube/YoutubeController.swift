//
//  YoutubeController.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/22/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

class YoutubeController: UIViewController, IndicatorInfoProvider, UITableViewDelegate, UITableViewDataSource, YoutubeHeaderDelegate, YoutubeCellDelegate {
 
    var itemInfo: IndicatorInfo = "View"
    var tableYoutube = UITableView()
    var dataPost = NSMutableArray()
    
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        getData()
    }
    
    func getData(){
        // change your apikey n playlistId in youtube developer
        // youtube_api_key = AIzaSyBQjpE3RBtPm9PyquAMbhNCMkaYzhHpjbI
        // playlistId = PLOU2XLYxmsIJqntMn36kS3y_lxKmQiaAS
        
        let url = URL(string: "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLOU2XLYxmsIJqntMn36kS3y_lxKmQiaAS&maxResults=10&key=AIzaSyBQjpE3RBtPm9PyquAMbhNCMkaYzhHpjbI")
        let task = URLSession.shared.dataTask(with: url!) { (dataTask, responTask, errorTask) in
            
            if errorTask != nil{
                FunctionDefault.AlertMessage(title: "Error", message: (errorTask?.localizedDescription)!, targetVC: self)
            }else{
                if let urlContent = dataTask{
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        let dataJson = jsonResult["items"] as! NSMutableArray
                        for i in 0..<dataJson.count{
                            self.dataPost.add(dataJson[i])
                        }
                        
                        DispatchQueue.main.async {
                            self.tableYoutube.reloadData()
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
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // Create table
        tableYoutube.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-120)
        tableYoutube.delegate = self;
        tableYoutube.dataSource = self;
        tableYoutube.backgroundColor = UIColor.clear
        tableYoutube.separatorColor = UIColor.groupTableViewBackground
        tableYoutube.allowsSelection = false
        tableYoutube.register(UINib(nibName: "YoutubeHeader", bundle: nil), forCellReuseIdentifier: "YoutubeHeader")
        tableYoutube.register(UINib(nibName: "YoutubeCell", bundle: nil), forCellReuseIdentifier: "YoutubeCell")
        self.view.addSubview(tableYoutube)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataPost.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 187
        }else{
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "YoutubeHeader", for: indexPath) as! YoutubeHeader
            
            let json = self.dataPost[indexPath.row] as AnyObject
            let snippet = json["snippet"] as AnyObject
            
            let thumbnails = snippet["thumbnails"] as AnyObject
            let defaultImg = thumbnails["default"] as AnyObject
            
            cell.img.downloadedFrom(url: URL(string:(defaultImg["url"] as? String)!)!, contentMode: .scaleAspectFill)
            
            cell.title.text = snippet["title"] as? String
            cell.name.text = snippet["channelTitle"] as? String
                        
            cell.index = indexPath
            cell.delegate = self
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "YoutubeCell", for: indexPath) as! YoutubeCell
            
            let json = self.dataPost[indexPath.row] as AnyObject
            let snippet = json["snippet"] as AnyObject
            
            let thumbnails = snippet["thumbnails"] as AnyObject
            let defaultImg = thumbnails["default"] as AnyObject

            cell.img.downloadedFrom(url: URL(string:(defaultImg["url"] as? String)!)!, contentMode: .scaleAspectFill)

            cell.title.text = snippet["title"] as? String
            cell.name.text = snippet["channelTitle"] as? String

            cell.index = indexPath
            cell.delegate = self
            return cell
        }
    }
    
    // YoutubeHeaderDelegate
    func pushHeader(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "Message", message: "Push Header", targetVC: self)
    }
    
    // YoutubeCellDelegate
    func pushCell(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "Message", message: "Push Cell", targetVC: self)
    }
    
    
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
