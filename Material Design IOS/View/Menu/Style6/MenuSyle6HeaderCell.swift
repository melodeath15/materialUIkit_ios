//
//  MenuSyle6HeaderCell.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/13/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

protocol MenuSyle6HeaderCellDelegate {
    func toggleSection(header: MenuSyle6HeaderCell, section: Int)
}

class MenuSyle6HeaderCell: UITableViewHeaderFooterView {
    
    var delegate: MenuSyle6HeaderCellDelegate?
    var section: Int!
    @IBOutlet var nameHeader: UILabel!
    @IBOutlet var btnNext: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
    }
    
    func selectHeaderAction(gestureRecognizer: UITapGestureRecognizer) {
        let cell = gestureRecognizer.view as! MenuSyle6HeaderCell
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
}
