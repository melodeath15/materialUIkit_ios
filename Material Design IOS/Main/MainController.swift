//
//  MainController.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/22/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class MainController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var header: UIView = UIView()
    var collMenu: UICollectionView!
    var listMenu = [NSString]()
    var countMenu = [NSString]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        listMenu = ["Login & Sign In", "Activity", "Walkthrough", "Menu", "Gallery", "Ecommerce", "Profile", "Content"]
        countMenu = ["25", "30", "20", "20", "25", "30", "30", "8"]
        
        createHeader()
        creatTable()
    }
    
    func createHeader() {
        header = Bundle.main.loadNibNamed("MenuHeader", owner: nil, options: nil)?.first as! MenuHeader
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height/8)
        self.view .addSubview(header)
    }
    
    func creatTable() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.size.width/2.3, height: self.view.frame.size.height/5)

        collMenu = UICollectionView(frame: CGRect(x: 0, y: self.view.frame.size.height/8, width: self.view.frame.size.width, height: self.view.frame.size.height-self.view.frame.size.height/8), collectionViewLayout: layout)
        
        let imageBg = UIImageView(image: #imageLiteral(resourceName: "splase"))
        imageBg.contentMode = .scaleAspectFill
        imageBg.alpha = 0.5
        collMenu.backgroundView = imageBg
        
        collMenu.delegate = self;
        collMenu.dataSource = self;
        
        collMenu.register(UINib(nibName: "MenuCell", bundle:nil), forCellWithReuseIdentifier: "MenuCell")
        
        self.view.addSubview(collMenu)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listMenu.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.title?.text = listMenu[indexPath.row] as String
        cell.count?.text = "Total: \(countMenu[indexPath.row])"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let controll = story.instantiateViewController(withIdentifier: "MainDetail") as! MainDetail
        
        controll.menuKe = indexPath.row
        controll.countMenu = countMenu[indexPath.row].integerValue
        controll.nameTitle = listMenu[indexPath.row] as String
        navigationController?.pushViewController(controll, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
