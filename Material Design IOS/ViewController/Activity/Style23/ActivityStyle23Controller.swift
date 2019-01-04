//
//  ActivityStyle23Controller.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class ActivityStyle23Controller: UIViewController, UITableViewDelegate, UITableViewDataSource, ViewActivityStyle1HeaderDelegate {
    
    private var tableStyle: UITableView = UITableView() // var tableView
    var header = ViewActivityStyle1Header() // var view xib in folder style1 name ViewActivityStyle1Header
    let model = DataDefault() // var dummy data

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.createDataImageProfile2() // create data dummy
        createView() // function for create header, create table and regis UINib
    }
    
    func createView(){
        
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
        
        // Create Table
        tableStyle.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height-80)
        tableStyle.delegate = self;
        tableStyle.dataSource = self;
        tableStyle.backgroundColor = UIColor.init(red: 243/255, green: 246/255, blue: 249/255, alpha: 1)
        tableStyle.separatorColor = UIColor.clear
        tableStyle.allowsSelection = false
        
        // regis UINib for header tableviewcell
        tableStyle.register(UINib(nibName: "ViewActivityStyle2HeaderTable", bundle: nil), forHeaderFooterViewReuseIdentifier: "ViewActivityStyle2HeaderTable")
        
        // register UINib for ViewActivityStyle23
        tableStyle.register(UINib(nibName: "ViewActivityStyle23", bundle: nil), forCellReuseIdentifier: "ViewActivityStyle23")
        
        self.view .addSubview(tableStyle)
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headercell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ViewActivityStyle2HeaderTable") as! ViewActivityStyle2HeaderTable
        
        switch section {
        case 0:
            headercell.title.textAlignment = NSTextAlignment.center
            headercell.title.text = "Today, 25 June 2016"
        default:
            break
        }
        
        return headercell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.dataImageProfile2.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 180
        }else if indexPath.row == 1{
            return 220
        }else if indexPath.row == 2{
            return 150
        }else if indexPath.row == 3{
            return 150
        }else if indexPath.row == 4{
            return 180
        }else if indexPath.row == 5{
            return 220
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewActivityStyle23", for: indexPath) as! ViewActivityStyle23

        cell.imgProfile.image = model.dataImageProfile2[indexPath.row]
        
        switch indexPath.row {
        case 0:
            cell.name.text = "Christina"
            cell.time.text = "17:53"
            cell.des.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque aliquet vehicula mi. Donec vel leo sapien. In ultrices id lorem sollicitudin volutpat"
        case 1:
            cell.name.text = "Remi Boucher"
            cell.time.text = "13:30"
            cell.des.text = " Praesent finibus at est in dictum. Ut imperdiet scelerisque erat, quis varius mi condimentum ac. Sed consequat ut lacus eu sagittis.Praesent finibus at est in dictum. Ut imperdiet scelerisque erat, quis varius mi condimentum ac. Sed consequat ut lacus eu sagittis."
        case 2:
            cell.name.text = "Steve Rogers"
            cell.time.text = "10:17"
            cell.des.text = "Suspendisse blandit, augue eget pretium tincidunt, orci nisi commodo erat."
        case 3:
            cell.name.text = "Ludwig Beethov"
            cell.time.text = "Yesterday"
            cell.des.text = "Cras tortor lorem, placerat at dui congue, molestie interdum augue"
        case 4:
            cell.name.text = "Christina"
            cell.time.text = "17:53"
            cell.des.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque aliquet vehicula mi. Donec vel leo sapien. In ultrices id lorem sollicitudin volutpat"
        case 5:
            cell.name.text = "Remi Boucher"
            cell.time.text = "13:30"
            cell.des.text = " Praesent finibus at est in dictum. Ut imperdiet scelerisque erat, quis varius mi condimentum ac. Sed consequat ut lacus eu sagittis.Praesent finibus at est in dictum. Ut imperdiet scelerisque erat, quis varius mi condimentum ac. Sed consequat ut lacus eu sagittis."
        default:
            break
        }
      
        cell.backgroundColor = UIColor.clear
        return cell
            
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
