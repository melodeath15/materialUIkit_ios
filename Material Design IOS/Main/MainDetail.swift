//
//  MainDetail.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/23/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MainDetail: UIViewController, UITableViewDelegate, UITableViewDataSource, HeaderDetailDelegate {

    
    private var tableDetail: UITableView = UITableView()
    var header = HeaderDetail()
    var menuKe = NSInteger()
    var countMenu = NSInteger()
    var nameTitle: String?
    var listDetail = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDetail()
        createHeader()
        createTable()
    }
    
    func getDetail(){
        if menuKe == 7{
            listDetail.append("Wordpress")
            listDetail.append("Youtube")
            listDetail.append("Tumblr")
            listDetail.append("Instagram")
            listDetail.append("Pinterst")
            listDetail.append("Soundcloud")
            listDetail.append("Twitter")
            listDetail.append("Facebook")
        }else{
            for i in 1 ... countMenu{
                listDetail.append("Style \(i)")
            }
        }
    }
    
    func createHeader(){
        
        // Create Header
        header = Bundle.main.loadNibNamed("HeaderDetail", owner: nil, options: nil)?.first as! HeaderDetail
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height/8)
        header.title.text = nameTitle
        header.delegate = self
        self.view.addSubview(header)
    }
    
    func createTable(){
        
        // Create Table
        tableDetail.frame = CGRect(x: 0, y: self.view.frame.size.height/8, width: self.view.frame.size.width, height: self.view.frame.size.height-self.view.frame.size.height/8)
        tableDetail.delegate = self;
        tableDetail.dataSource = self;
        tableDetail.backgroundColor = UIColor.clear
        
        self.view .addSubview(tableDetail)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDetail.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        }

        cell?.detailTextLabel?.text = listDetail[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if menuKe == 0{
            let story = UIStoryboard(name: "Login&Signup", bundle: nil)
            
            switch indexPath.row {
            case 0:
                let controll = story.instantiateViewController(withIdentifier: "Style1Controller") as! Style1Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 1:
                let controll = story.instantiateViewController(withIdentifier: "Style2Controller") as! Style2Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 2:
                let controll = story.instantiateViewController(withIdentifier: "Style3Controller") as! Style3Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 3:
                let controll = story.instantiateViewController(withIdentifier: "Style4Controller") as! Style4Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 4:
                let controll = story.instantiateViewController(withIdentifier: "Style5Controller") as! Style5Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 5:
                let controll = story.instantiateViewController(withIdentifier: "Style6Controller") as! Style6Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 6:
                let controll = story.instantiateViewController(withIdentifier: "Style7Controller") as! Style7Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 7:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealViewControllerStyle8") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 8:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealViewControllerStyle9") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 9:
                let controll = story.instantiateViewController(withIdentifier: "Style10Controller") as! Style10Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 10:
                let controll = story.instantiateViewController(withIdentifier: "Style11Controller") as! Style11Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 11:
                let controll = story.instantiateViewController(withIdentifier: "Style12Controller") as! Style12Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 12:
                let controll = story.instantiateViewController(withIdentifier: "Style13Controller") as! Style13Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 13:
                let controll = story.instantiateViewController(withIdentifier: "Style14Controller") as! Style14Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 14:
                let controll = story.instantiateViewController(withIdentifier: "Style15Controller") as! Style15Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 15:
                let controll = story.instantiateViewController(withIdentifier: "Style16Controller") as! Style16Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 16:
                let controll = story.instantiateViewController(withIdentifier: "Style17Controller") as! Style17Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 17:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealViewControllerStyle18") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 18:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealViewControllerStyle19") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 19:
                let controll = story.instantiateViewController(withIdentifier: "Style20Controller") as! Style20Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 20:
                let controll = story.instantiateViewController(withIdentifier: "Style21Controller") as! Style21Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 21:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealViewControllerStyle22") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 22:
                let controll = story.instantiateViewController(withIdentifier: "Style23Controller") as! Style23Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 23:
                let controll = story.instantiateViewController(withIdentifier: "Style24Controller") as! Style24Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 24:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealViewControllerStyle25") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            default:
                break
            }
        }
        
        else if menuKe == 1{
            
            let story = UIStoryboard(name: "Activity", bundle: nil)

            switch indexPath.row {
            case 0:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity1") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 1:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity2") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 2:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity3") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 3:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity4") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 4:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity5") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 5:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity6") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 6:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity7") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 7:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity8") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 8:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity9") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 9:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity10") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 10:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity11") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 11:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity12") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 12:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity13") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 13:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity14") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 14:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity15") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 15:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity16") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 16:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity17") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 17:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity18") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 18:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity19") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 19:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity20") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 20:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity21") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 21:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity22") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 22:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity23") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 23:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity24") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 24:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealActivity25") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 25:
                let controll = story.instantiateViewController(withIdentifier: "ActivityStyle26Controller") as! ActivityStyle26Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 26:
                let controll = story.instantiateViewController(withIdentifier: "ActivityStyle27Controller") as! ActivityStyle27Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 27:
                let controll = story.instantiateViewController(withIdentifier: "ActivityStyle28Controller") as! ActivityStyle28Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 28:
                let controll = story.instantiateViewController(withIdentifier: "ActivityStyle29Controller") as! ActivityStyle29Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            case 29:
                let controll = story.instantiateViewController(withIdentifier: "ActivityStyle30Controller") as! ActivityStyle30Controller
                navigationController?.pushViewController(controll, animated: true)
                break
            default:
                break
            }
        }else if menuKe == 2{
        
            let story = UIStoryboard(name: "Walkthrough", bundle: nil)
            
            switch indexPath.row {
            case 0:
                let controll = story.instantiateViewController(withIdentifier: "PageControlStyle1") as! PageControlStyle1
                navigationController?.pushViewController(controll, animated: true)
                break
            case 1:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealWalkthrough2") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 2:
                let controll = story.instantiateViewController(withIdentifier: "PageControlStyle3") as! PageControlStyle3
                navigationController?.pushViewController(controll, animated: true)
                break
            case 3:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealWalkthrough4") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 4:
                let controll = story.instantiateViewController(withIdentifier: "PageControlStyle5") as! PageControlStyle5
                navigationController?.pushViewController(controll, animated: true)
                break
            case 5:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealWalkthrough6") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 6:
                let controll = story.instantiateViewController(withIdentifier: "PageControlStyle7") as! PageControlStyle7
                navigationController?.pushViewController(controll, animated: true)
                break
            case 7:
                let controll = story.instantiateViewController(withIdentifier: "PageControlStyle8") as! PageControlStyle8
                navigationController?.pushViewController(controll, animated: true)
                break
            case 8:
                let controll = story.instantiateViewController(withIdentifier: "PageControlStyle9") as! PageControlStyle9
                navigationController?.pushViewController(controll, animated: true)
                break
            case 9:
                let controll = story.instantiateViewController(withIdentifier: "PageControlStyle10") as! PageControlStyle10
                navigationController?.pushViewController(controll, animated: true)
                break
            case 10:
                let controll = story.instantiateViewController(withIdentifier: "PageControlStyle11") as! PageControlStyle11
                navigationController?.pushViewController(controll, animated: true)
                break
            case 11:
                let controll = story.instantiateViewController(withIdentifier: "PageControlStyle12") as! PageControlStyle12
                navigationController?.pushViewController(controll, animated: true)
                break
            case 12:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealWalkthrough13") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 13:
                let controll = story.instantiateViewController(withIdentifier: "PageControlStyle14") as! PageControlStyle14
                navigationController?.pushViewController(controll, animated: true)
                break
            case 14:
                let controll = story.instantiateViewController(withIdentifier: "PageControlStyle15") as! PageControlStyle15
                navigationController?.pushViewController(controll, animated: true)
                break
            case 15:
                let controll = story.instantiateViewController(withIdentifier: "PageControlStyle16") as! PageControlStyle16
                navigationController?.pushViewController(controll, animated: true)
                break
            case 16:
                let controll = story.instantiateViewController(withIdentifier: "PageControlStyle17") as! PageControlStyle17
                navigationController?.pushViewController(controll, animated: true)
                break
            case 17:
                let controll = story.instantiateViewController(withIdentifier: "PageControlStyle18") as! PageControlStyle18
                navigationController?.pushViewController(controll, animated: true)
                break
            case 18:
                let controll = story.instantiateViewController(withIdentifier: "PageControlStyle19") as! PageControlStyle19
                navigationController?.pushViewController(controll, animated: true)
                break
            case 19:
                let controll = story.instantiateViewController(withIdentifier: "PageControlStyle20") as! PageControlStyle20
                navigationController?.pushViewController(controll, animated: true)
                break
            default:
                break
            }
            
        }else if menuKe == 3{
            
            let story = UIStoryboard(name: "Menu", bundle: nil)
            
            switch indexPath.row {
            case 0:
                let controll = story.instantiateViewController(withIdentifier: "MenuControllerStyle1") as! MenuControllerStyle1
                navigationController?.pushViewController(controll, animated: true)
                break
            case 1:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuStyle2") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 2:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuStyle3") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 3:
                let controll = story.instantiateViewController(withIdentifier: "MenuControllerStyle4") as! MenuControllerStyle4
                navigationController?.pushViewController(controll, animated: true)
                break
            case 4:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuStyle5") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 5:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuStyle6") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 6:
                let controll = story.instantiateViewController(withIdentifier: "MenuControllerStyle7") as! MenuControllerStyle7
                navigationController?.pushViewController(controll, animated: true)
                break
            case 7:
                let controll = story.instantiateViewController(withIdentifier: "MenuControllerStyle8") as! MenuControllerStyle8
                navigationController?.pushViewController(controll, animated: true)
                break
            case 8:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuStyle9") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 9:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuStyle10") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 10:
                let controll = story.instantiateViewController(withIdentifier: "MenuControllerStyle11") as! MenuControllerStyle11
                navigationController?.pushViewController(controll, animated: true)
                break
            case 11:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuStyle12") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 12:
                let controll = story.instantiateViewController(withIdentifier: "MenuControllerStyle13") as! MenuControllerStyle13
                navigationController?.pushViewController(controll, animated: true)
                break
            case 13:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuStyle14") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 14:
                let controll = story.instantiateViewController(withIdentifier: "MenuControllerStyle15") as! MenuControllerStyle15
                navigationController?.pushViewController(controll, animated: true)
                break
            case 15:
                let controll = story.instantiateViewController(withIdentifier: "MenuControllerStyle16") as! MenuControllerStyle16
                navigationController?.pushViewController(controll, animated: true)
                break
            case 16:
                let controll = story.instantiateViewController(withIdentifier: "MenuControllerStyle17") as! MenuControllerStyle17
                navigationController?.pushViewController(controll, animated: true)
                break
            case 17:
                let controll = story.instantiateViewController(withIdentifier: "MenuControllerStyle18") as! MenuControllerStyle18
                navigationController?.pushViewController(controll, animated: true)
                break
            case 18:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuStyle19") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 19:
                let controll = story.instantiateViewController(withIdentifier: "MenuControllerStyle20") as! MenuControllerStyle20
                navigationController?.pushViewController(controll, animated: true)
                break
            default:
                break
            }
            
        }else if menuKe == 4{
            
            let story = UIStoryboard(name: "Gallery", bundle: nil)
            
            switch indexPath.row {
            case 0:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealGalleryStyle1") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 1:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealGalleryStyle2") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 2:
                let controll = story.instantiateViewController(withIdentifier: "GalleryControllerStyle3") as! GalleryControllerStyle3
                navigationController?.pushViewController(controll, animated: true)
                break
            case 3:
                let controll = story.instantiateViewController(withIdentifier: "GalleryControllerStyle4") as! GalleryControllerStyle4
                navigationController?.pushViewController(controll, animated: true)
                break
            case 4:
                let controll = story.instantiateViewController(withIdentifier: "GalleryControllerStyle5") as! GalleryControllerStyle5
                navigationController?.pushViewController(controll, animated: true)
                break
            case 5:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealGalleryStyle6") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 6:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealGalleryStyle7") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 7:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealGalleryStyle8") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 8:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealGalleryStyle9") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 9:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealGalleryStyle10") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 10:
                let controll = story.instantiateViewController(withIdentifier: "GalleryControllerStyle11") as! GalleryControllerStyle11
                navigationController?.pushViewController(controll, animated: true)
                break
            case 11:
                let controll = story.instantiateViewController(withIdentifier: "GalleryControllerStyle12") as! GalleryControllerStyle12
                navigationController?.pushViewController(controll, animated: true)
                break
            case 12:
                let controll = story.instantiateViewController(withIdentifier: "GalleryControllerStyle13") as! GalleryControllerStyle13
                navigationController?.pushViewController(controll, animated: true)
                break
            case 13:
                let controll = story.instantiateViewController(withIdentifier: "GalleryControllerStyle14") as! GalleryControllerStyle14
                navigationController?.pushViewController(controll, animated: true)
                break
            case 14:
                let controll = story.instantiateViewController(withIdentifier: "GalleryControllerStyle15") as! GalleryControllerStyle15
                navigationController?.pushViewController(controll, animated: true)
                break
            case 15:
                let controll = story.instantiateViewController(withIdentifier: "GalleryControllerStyle16") as! GalleryControllerStyle16
                navigationController?.pushViewController(controll, animated: true)
                break
            case 16:
                let controll = story.instantiateViewController(withIdentifier: "GalleryControllerStyle17") as! GalleryControllerStyle17
                navigationController?.pushViewController(controll, animated: true)
                break
            case 17:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealGalleryStyle18") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 18:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealGalleryStyle19") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 19:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealGalleryStyle20") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 20:
                let controll = story.instantiateViewController(withIdentifier: "GalleryControllerStyle21") as! GalleryControllerStyle21
                navigationController?.pushViewController(controll, animated: true)
                break
            case 21:
                let controll = story.instantiateViewController(withIdentifier: "GalleryControllerStyle22") as! GalleryControllerStyle22
                navigationController?.pushViewController(controll, animated: true)
                break
            case 22:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealGalleryStyle23") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 23:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealGalleryStyle24") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 24:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealGalleryStyle25") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            default:
                break
            }
        }else if menuKe == 5{
            
            let story = UIStoryboard(name: "Ecommerce", bundle: nil)
            
            switch indexPath.row {
            case 0:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealEcommerceStyle1") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 1:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealEcommerceStyle2") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 2:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle3") as! EcommerceControllerStyle3
                navigationController?.pushViewController(controll, animated: true)
                break
            case 3:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle4") as! EcommerceControllerStyle4
                navigationController?.pushViewController(controll, animated: true)
                break
            case 4:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealEcommerceStyle5") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 5:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle6") as! EcommerceControllerStyle6
                navigationController?.pushViewController(controll, animated: true)
                break
            case 6:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealEcommerceStyle7") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 7:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle8") as! EcommerceControllerStyle8
                navigationController?.pushViewController(controll, animated: true)
                break
            case 8:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealEcommerceStyle9") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 9:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle10") as! EcommerceControllerStyle10
                navigationController?.pushViewController(controll, animated: true)
                break
            case 10:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle11") as! EcommerceControllerStyle11
                navigationController?.pushViewController(controll, animated: true)
                break
            case 11:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle12") as! EcommerceControllerStyle12
                navigationController?.pushViewController(controll, animated: true)
                break
            case 12:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle13") as! EcommerceControllerStyle13
                navigationController?.pushViewController(controll, animated: true)
                break
            case 13:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle14") as! EcommerceControllerStyle14
                navigationController?.pushViewController(controll, animated: true)
                break
            case 14:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle15") as! EcommerceControllerStyle15
                navigationController?.pushViewController(controll, animated: true)
                break
            case 15:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle16") as! EcommerceControllerStyle16
                navigationController?.pushViewController(controll, animated: true)
                break
            case 16:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle17") as! EcommerceControllerStyle17
                navigationController?.pushViewController(controll, animated: true)
                break
            case 17:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle18") as! EcommerceControllerStyle18
                navigationController?.pushViewController(controll, animated: true)
                break
            case 18:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle19") as! EcommerceControllerStyle19
                navigationController?.pushViewController(controll, animated: true)
                break
            case 19:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle20") as! EcommerceControllerStyle20
                navigationController?.pushViewController(controll, animated: true)
                break
            case 20:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle21") as! EcommerceControllerStyle21
                navigationController?.pushViewController(controll, animated: true)
                break
            case 21:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle22") as! EcommerceControllerStyle22
                navigationController?.pushViewController(controll, animated: true)
                break
            case 22:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle23") as! EcommerceControllerStyle23
                navigationController?.pushViewController(controll, animated: true)
                break
            case 23:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle24") as! EcommerceControllerStyle24
                navigationController?.pushViewController(controll, animated: true)
                break
            case 24:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle25") as! EcommerceControllerStyle25
                navigationController?.pushViewController(controll, animated: true)
                break
            case 25:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle26") as! EcommerceControllerStyle26
                navigationController?.pushViewController(controll, animated: true)
                break
            case 26:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle27") as! EcommerceControllerStyle27
                navigationController?.pushViewController(controll, animated: true)
                break
            case 27:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle28") as! EcommerceControllerStyle28
                navigationController?.pushViewController(controll, animated: true)
                break
            case 28:
                let controll = story.instantiateViewController(withIdentifier: "EcommerceControllerStyle29") as! EcommerceControllerStyle29
                navigationController?.pushViewController(controll, animated: true)
                break
            case 29:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealEcommerceStyle30") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            default:
                break
            }
        }else if menuKe == 6{
            
            let story = UIStoryboard(name: "Profile", bundle: nil)
            
            switch indexPath.row {
            case 0:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile1") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 1:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile2") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 2:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile3") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 3:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile4") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 4:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile5") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 5:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile6") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 6:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile7") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 7:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile8") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 8:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile9") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 9:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile10") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 10:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile11") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 11:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile12") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 12:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile13") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 13:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile14") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 14:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile15") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 15:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile16") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 16:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile17") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 17:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile18") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 18:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile19") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 19:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile20") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 20:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile21") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 21:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile22") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 22:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile23") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 23:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile24") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 24:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile25") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 25:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile26") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 26:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile27") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 27:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile28") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 28:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile29") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 29:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealMenuProfile30") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            default:
                break
            }
        }else if menuKe == 7{
            let story = UIStoryboard(name: "Content", bundle: nil)
            
            switch indexPath.row {
            case 0:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealWordpress") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 1:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealYoutube") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 2:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealTumblr") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 3:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealInst") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 4:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealPinterest") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 5:
                let controll = story.instantiateViewController(withIdentifier: "SoundcloudController") as! SoundcloudController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 6:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealTwitter") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            case 7:
                let controll = story.instantiateViewController(withIdentifier: "SWRevealFacebook") as! SWRevealViewController
                navigationController?.pushViewController(controll, animated: true)
                break
            default:
                break
            }
        }
    }
    
    // HeaderDetailDelegate
    func back() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
