//
//  EcommerceStyle11Size.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 8/4/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol EcommerceStyle11SizeDelegate {
    func xs()
    func s()
    func m()
    func l()
    func xl()
}

class EcommerceStyle11Size: UITableViewCell {
    
    var delegate: EcommerceStyle11SizeDelegate?
    
    @IBOutlet var labelSize: UILabel!
    @IBOutlet var btnM: UIButton!
    @IBOutlet var btnL: UIButton!
    @IBOutlet var btnXL: UIButton!
    @IBOutlet var btnS: UIButton!
    @IBOutlet var btnXS: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnM.layer.cornerRadius = btnM.frame.size.width/2
        btnM.clipsToBounds = true
        
        btnL.layer.cornerRadius = btnL.frame.size.width/2
        btnL.clipsToBounds = true
        
        btnXL.layer.cornerRadius = btnXL.frame.size.width/2
        btnXL.clipsToBounds = true
        
        btnS.layer.cornerRadius = btnS.frame.size.width/2
        btnS.clipsToBounds = true
        
        btnXS.layer.cornerRadius = btnXS.frame.size.width/2
        btnXS.clipsToBounds = true
        
    }
    
    @IBAction func pushBtnXS(_ sender: Any) {
        btnXS.backgroundColor = UIColor.init(red: 250/255.0, green: 163/255.0, blue: 24/255.0, alpha: 1)
        btnXS.setTitleColor(UIColor.white, for: .normal)
        
        btnS.backgroundColor = UIColor.white
        btnS.setTitleColor(UIColor.lightGray, for: .normal)
        
        btnM.backgroundColor = UIColor.white
        btnM.setTitleColor(UIColor.lightGray, for: .normal)
        
        btnL.backgroundColor = UIColor.white
        btnL.setTitleColor(UIColor.lightGray, for: .normal)
        
        btnXL.backgroundColor = UIColor.white
        btnXL.setTitleColor(UIColor.lightGray, for: .normal)
        
        delegate?.xs()
    }
    
    @IBAction func pushBtnS(_ sender: Any) {
        btnXS.backgroundColor = UIColor.white
        btnXS.setTitleColor(UIColor.lightGray, for: .normal)
        
        btnS.backgroundColor = UIColor.init(red: 250/255.0, green: 163/255.0, blue: 24/255.0, alpha: 1)
        btnS.setTitleColor(UIColor.white, for: .normal)
        
        btnM.backgroundColor = UIColor.white
        btnM.setTitleColor(UIColor.lightGray, for: .normal)
        
        btnL.backgroundColor = UIColor.white
        btnL.setTitleColor(UIColor.lightGray, for: .normal)
        
        btnXL.backgroundColor = UIColor.white
        btnXL.setTitleColor(UIColor.lightGray, for: .normal)
        
        delegate?.s()
    }

    @IBAction func pushBtnM(_ sender: Any) {
        btnXS.backgroundColor = UIColor.white
        btnXS.setTitleColor(UIColor.lightGray, for: .normal)
        
        btnS.backgroundColor = UIColor.white
        btnS.setTitleColor(UIColor.lightGray, for: .normal)
        
        btnM.backgroundColor = UIColor.init(red: 250/255.0, green: 163/255.0, blue: 24/255.0, alpha: 1)
        btnM.setTitleColor(UIColor.white, for: .normal)
        
        btnL.backgroundColor = UIColor.white
        btnL.setTitleColor(UIColor.lightGray, for: .normal)
        
        btnXL.backgroundColor = UIColor.white
        btnXL.setTitleColor(UIColor.lightGray, for: .normal)
        
        delegate?.m()
    }
    
    @IBAction func pushBtnL(_ sender: Any) {
        btnXS.backgroundColor = UIColor.white
        btnXS.setTitleColor(UIColor.lightGray, for: .normal)
        
        btnS.backgroundColor = UIColor.white
        btnS.setTitleColor(UIColor.lightGray, for: .normal)
        
        btnM.backgroundColor = UIColor.white
        btnM.setTitleColor(UIColor.lightGray, for: .normal)
        
        btnL.backgroundColor = UIColor.init(red: 250/255.0, green: 163/255.0, blue: 24/255.0, alpha: 1)
        btnL.setTitleColor(UIColor.white, for: .normal)
        
        btnXL.backgroundColor = UIColor.white
        btnXL.setTitleColor(UIColor.lightGray, for: .normal)
        
        delegate?.l()
    }
    
    @IBAction func pushBtnXL(_ sender: Any) {
        btnXS.backgroundColor = UIColor.white
        btnXS.setTitleColor(UIColor.lightGray, for: .normal)
        
        btnS.backgroundColor = UIColor.white
        btnS.setTitleColor(UIColor.lightGray, for: .normal)
        
        btnM.backgroundColor = UIColor.white
        btnM.setTitleColor(UIColor.lightGray, for: .normal)
        
        btnL.backgroundColor = UIColor.white
        btnL.setTitleColor(UIColor.lightGray, for: .normal)
        
        btnXL.backgroundColor = UIColor.init(red: 250/255.0, green: 163/255.0, blue: 24/255.0, alpha: 1)
        btnXL.setTitleColor(UIColor.white, for: .normal)
        
        delegate?.xl()
    }
    
}
