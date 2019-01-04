//
//  InstagramController.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/23/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

class InstagramController: UIViewController, UITableViewDelegate, UITableViewDataSource, HeaderContentDelegate, InstagramCellDelegate {
    
    var header = HeaderContent()
    var tableInst = UITableView()
    var dataPost = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        getData()
    }
    
    func getData(){
        // http://instagram.pixelunion.net/
        // access_token=6937770572.1677ed0.d99130ebc47f4a25b05deda03b251e07
        
        let url = URL(string: "https://api.instagram.com/v1/users/self/media/recent?access_token=6937770572.1677ed0.d99130ebc47f4a25b05deda03b251e07")
        let task = URLSession.shared.dataTask(with: url!) { (dataTask, responTask, errorTask) in
            
            if errorTask != nil{
                FunctionDefault.AlertMessage(title: "Error", message: (errorTask?.localizedDescription)!, targetVC: self)
            }else{
                if let urlContent = dataTask{
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        let dataJson = jsonResult["data"] as! NSMutableArray
                        for i in 0..<dataJson.count{
                            self.dataPost.add(dataJson[i])
                        }
                        
                        DispatchQueue.main.async {
                            self.tableInst.reloadData()
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
        
        // create header
        header = Bundle.main.loadNibNamed("HeaderContent", owner: nil, options: nil)?.first as! HeaderContent
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Instagram Feeds"
        
        header.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.addSubview(header)
        
        // Create table
        tableInst.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        tableInst.delegate = self;
        tableInst.dataSource = self;
        tableInst.backgroundColor = UIColor.clear
        tableInst.separatorColor = UIColor.groupTableViewBackground
        tableInst.allowsSelection = false
        tableInst.register(UINib(nibName: "InstagramCell", bundle: nil), forCellReuseIdentifier: "InstagramCell")
        self.view.addSubview(tableInst)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataPost.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InstagramCell", for: indexPath) as! InstagramCell
        
        let json = self.dataPost[indexPath.row] as AnyObject
        let user = json["user"] as AnyObject
        cell.profile.downloadedFrom(url: URL(string:(user["profile_picture"] as? String)!)!, contentMode: .scaleAspectFill)
        cell.name.text = user["full_name"] as? String

        cell.timeDate.text = json["created_time"] as? String
        
        let likes = json["likes"] as AnyObject
        cell.valueLove.text = "\((likes["count"] as! Int))"
        
        
        let caption = json["caption"] as AnyObject
        cell.deskription.text = caption["text"] as? String
        
        let tags = json["tags"] as! NSMutableArray
        var tagsText = ""
        for i in 0..<tags.count{
            tagsText += "#\(tags[i]), "
        }
        cell.hastax.text = tagsText
        
        let images = json["images"] as AnyObject
        let thumbnail = images["thumbnail"] as AnyObject
        cell.img.downloadedFrom(url: URL(string:(thumbnail["url"] as? String)!)!, contentMode: .scaleAspectFill)

        let comments = json["comments"] as AnyObject
        cell.btnComment.setTitle("\(comments["count"] as! Int) COMMENTS", for: .normal)
        
        cell.index = indexPath
        cell.delegate = self
        return cell
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
    
    // InstagramCellDelegate
    func commentCell(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "Comment", message: "", targetVC: self)
    }
    
    func shareCell(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "Share", message: "", targetVC: self)
    }
    
    func openCell(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "Open", message: "", targetVC: self)
    }
        
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
