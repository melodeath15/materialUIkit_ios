//
//  Style8MenuLeft.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/29/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class Style8MenuLeft: UIViewController, UITableViewDelegate, UITableViewDataSource, Style8BackDelegate {
    
    private var tableMenu: UITableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView() // call function table and regis xib/UINib

    }
    
    func createView() {
        // Create Table
        tableMenu.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        tableMenu.delegate = self;
        tableMenu.dataSource = self;
        tableMenu.backgroundColor = UIColor.white
        tableMenu.separatorColor = UIColor.clear
        tableMenu.allowsSelection = false
        tableMenu.isScrollEnabled = false
        
        // register UINib for Style8Back
        tableMenu.register(UINib(nibName: "Style8Back", bundle: nil), forCellReuseIdentifier: "Style8Back")
        
        self.view.addSubview(tableMenu)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Style8Back", for: indexPath) as! Style8Back
        cell.delegate = self
        return cell
    }
    
    // Delegate Style8BackDelegate
    func backMenu() { // function back
        navigationController?.popViewController(animated: true)
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
