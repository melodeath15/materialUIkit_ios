//
//  FacebookController.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 1/25/18.
//  Copyright © 2018 Mediatechindo. All rights reserved.
//

import UIKit

class FacebookController: UIViewController, UITableViewDelegate, UITableViewDataSource, TwitterHeaderDelegate, FacebookCellDelegate {
    
    var header = TwitterHeader()
    var tableFacebook = UITableView()
    var dataPost = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        getData()
    }
    
    func getData(){
        // facebook developer
        // https://developers.facebook.com/
        // edit app review user_post, user_videos, user_photos, user_likes untuk get data post, video, photo, like facebook.
        
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1)
        
        // create header
        header = Bundle.main.loadNibNamed("TwitterHeader", owner: nil, options: nil)?.first as! TwitterHeader
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.title.text = "Facebook Feeds"
        
        header.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.addSubview(header)
        
        // Create table
        tableFacebook.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        tableFacebook.delegate = self;
        tableFacebook.dataSource = self;
        tableFacebook.backgroundColor = UIColor.clear
        tableFacebook.separatorColor = UIColor.groupTableViewBackground
        tableFacebook.allowsSelection = false
        tableFacebook.register(UINib(nibName: "FacebookCell", bundle: nil), forCellReuseIdentifier: "FacebookCell")
        self.view.addSubview(tableFacebook)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FacebookCell", for: indexPath) as! FacebookCell
        
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
    
    // TwitterHeaderDelegate
    func search() {
        FunctionDefault.AlertMessage(title: "Search", message: "", targetVC: self)
    }
    // end
    
    // FacebookCellDelegate
    func comment(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "Comment", message: "", targetVC: self)
    }
    
    func love(index: IndexPath) {
        FunctionDefault.AlertMessage(title: "Love", message: "", targetVC: self)
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
