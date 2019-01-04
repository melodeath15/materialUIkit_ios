//
//  MenuStyle11Header.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/14/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol MenuStyle11HeaderDelegate {
    func menu()
    func searchBar(text: String)
}

class MenuStyle11Header: UIView, UISearchBarDelegate {
    
    var delegate: MenuStyle11HeaderDelegate?
    @IBOutlet var btnMenu: UIButton!
    @IBOutlet var searchBarCustom: UISearchBar!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        searchBarCustom.delegate = self
        searchBarCustom.layer.borderWidth = 0.5
        searchBarCustom.layer.borderColor = UIColor.init(red: 153/255.0, green: 42/255.0, blue: 179/255.0, alpha: 1) .cgColor
        searchBarCustom.clipsToBounds = true
        searchBarCustom.barTintColor = UIColor.init(red: 153/255.0, green: 42/255.0, blue: 179/255.0, alpha: 1)
        
    }
    
    @IBAction func pushBtnMenu(_ sender: Any) {
        delegate?.menu()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.searchBar(text: searchText)
        // logic
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBarCustom.text = ""
        searchBarCustom.resignFirstResponder()
        // logic
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // logic
    }

    
    
}
