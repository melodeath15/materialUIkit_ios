//
//  WordpressController.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/19/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

class WordpressController: UIViewController, IndicatorInfoProvider, UITableViewDelegate, UITableViewDataSource, WordpressHeaderDelegate, WordpressCellDelegate {
    
    var itemInfo: IndicatorInfo = "View"
    var tableWord = UITableView()
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
        // en.blog.wordpress.com = change your wordpress
        // number=10 = get 10 post
        let url = URL(string: "https://public-api.wordpress.com/rest/v1.1/sites/en.blog.wordpress.com/posts/?number=10")
        let task = URLSession.shared.dataTask(with: url!) { (dataTask, responTask, errorTask) in
            
            if errorTask != nil{
                FunctionDefault.AlertMessage(title: "Error", message: (errorTask?.localizedDescription)!, targetVC: self)
            }else{
                if let urlContent = dataTask{
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                    
                        let dataJson = jsonResult["posts"] as! NSMutableArray
                        for i in 0..<dataJson.count{
                            self.dataPost.add(dataJson[i])
                        }
                        
                        DispatchQueue.main.async {
                            self.tableWord.reloadData()
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
        tableWord.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-120)
        tableWord.delegate = self;
        tableWord.dataSource = self;
        tableWord.backgroundColor = UIColor.clear
        tableWord.separatorColor = UIColor.groupTableViewBackground
        tableWord.allowsSelection = false
        tableWord.register(UINib(nibName: "WordpressHeader", bundle: nil), forCellReuseIdentifier: "WordpressHeader")
        tableWord.register(UINib(nibName: "WordpressCell", bundle: nil), forCellReuseIdentifier: "WordpressCell")
        self.view.addSubview(tableWord)
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "WordpressHeader", for: indexPath) as! WordpressHeader
            
            let json = self.dataPost[indexPath.row] as AnyObject
            let img = json["post_thumbnail"] as AnyObject
            
            cell.img.downloadedFrom(url: URL(string:(img["URL"] as? String)!)!, contentMode: .scaleAspectFill)
            
            cell.title.text = json["title"] as? String
            cell.subtitle.text = (json["excerpt"] as? String)? .html2String
                        
            cell.index = indexPath
            cell.delegate = self
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "WordpressCell", for: indexPath) as! WordpressCell
            
            let json = self.dataPost[indexPath.row] as AnyObject
            let img = json["post_thumbnail"] as AnyObject

            cell.img.downloadedFrom(url: URL(string:(img["URL"] as? String)!)!, contentMode: .scaleAspectFill)
            
            cell.title.text = json["title"] as? String
            cell.subtitle.text = (json["excerpt"] as? String)? .html2String
            cell.date.text = json["modified"] as? String
            
            cell.index = indexPath
            cell.delegate = self
            return cell
        }
    }
    
    // WordpressHeaderDelegate
    func pushHeader(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "Message", message: "Push Header", targetVC: self)
    }
    
    // WordpressCellDelegate
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
