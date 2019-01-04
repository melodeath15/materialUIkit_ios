//
//  TwitterController.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/25/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

class TwitterController: UIViewController, UITableViewDelegate, UITableViewDataSource, TwitterHeaderDelegate, TwitterCellDelegate {
    
    var header = TwitterHeader()
    var tableTwitter = UITableView()
    var dataPost = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        getToken()
    }
    
    func getToken(){
        // change your Consumer Key n Consumer Secret in Twitter developer
        // https://www.base64encode.org/ for encode Consumer Key n Consumer Secret
        // encode(Consumer Key:Consumer Secret) for accses token
        // Authorization = basic hasil encode
        // Content-Type = application/x-www-form-urlencoded;charset=UTF-8
        // body post = grant_type = client_credentials
        
        let param = "grant_type=client_credentials"
        let url = NSURL(string: "https://api.twitter.com/oauth2/token")!
        let request = NSMutableURLRequest(url: url as URL)
        request.httpMethod = "POST"
        request.httpBody = param.data(using: .utf8)
        request.addValue("Basic eWFuaEZZc3VSaEJZb0hpelEyOTRhT1h6ajp0bUlCNjBLQ3ZGN2RCa3NWNG5xU2NsRllBSUYwcUU4bHRGT2hyb3pzY2ZONjk1bDg5Vw==", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request as URLRequest){ dataTask,responseTask,errorTask in
            if errorTask != nil{
                FunctionDefault.AlertMessage(title: "Error", message: (errorTask?.localizedDescription)!, targetVC: self)
            }else{
                if let urlContent = dataTask{
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: []) as AnyObject
                        self.getData(token: "\((jsonResult["token_type"] as? String)!) \((jsonResult["access_token"] as? String)!)")

                    }catch{
                        FunctionDefault.AlertMessage(title: "Error", message: "Json Parsing Failed", targetVC: self)
                    }
                }
            }
        }
        task.resume()
    }
    
    func getData(token: String){
        // screen_name change @nametwitter
        // count change get counter
        
        let url = NSURL(string: "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=accessndev&count=10")!
        let request = NSMutableURLRequest(url: url as URL)
        request.httpMethod = "GET"
        request.addValue(token, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: request as URLRequest){ dataTask,responseTask,errorTask in
            if errorTask != nil{
                FunctionDefault.AlertMessage(title: "Error", message: (errorTask?.localizedDescription)!, targetVC: self)
            }else{
                if let urlContent = dataTask{
                    var jsonResult:[Any]?
                    do {
                        jsonResult = try JSONSerialization.jsonObject(with: urlContent) as? [Any]
                        
                        if let jsonResult = jsonResult{
                            for i in 0..<jsonResult.count{
                                self.dataPost.add(jsonResult[i])
                            }
                        }
                        
                        DispatchQueue.main.async {
                            self.tableTwitter.reloadData()
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
        header = Bundle.main.loadNibNamed("TwitterHeader", owner: nil, options: nil)?.first as! TwitterHeader
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Twitter Feeds"
        
        header.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.addSubview(header)
        
        // Create table
        tableTwitter.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        tableTwitter.delegate = self;
        tableTwitter.dataSource = self;
        tableTwitter.backgroundColor = UIColor.clear
        tableTwitter.separatorColor = UIColor.groupTableViewBackground
        tableTwitter.allowsSelection = false
        tableTwitter.register(UINib(nibName: "TwitterCell", bundle: nil), forCellReuseIdentifier: "TwitterCell")
        self.view.addSubview(tableTwitter)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataPost.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TwitterCell", for: indexPath) as! TwitterCell
        
        let json = self.dataPost[indexPath.row] as AnyObject
        let user = json["user"] as AnyObject
        cell.name.text = user["name"] as? String
        cell.nameScreen.text = "@\(user["screen_name"] as! String)"
        cell.datePost.text = json["created_at"] as? String
        
        cell.img.downloadedFrom(url: URL(string:(user["profile_image_url_https"] as? String)!)!, contentMode: .scaleAspectFill)

        cell.textTweet.text = json["text"] as? String
        cell.valueRetweet.text = "\(json["retweet_count"] as! Int)"
    
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
    
    // TwitterHeaderDelegate
    func search() {
        FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)
    }
    // end
    
    // TwitterCellDelegate
    func retweet(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "Retweet", message: "", targetVC: self)
    }
    
    func share(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "Share", message: "", targetVC: self)
    }
    
    func open(index: IndexPath) {
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
