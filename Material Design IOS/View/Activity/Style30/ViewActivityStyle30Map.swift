//
//  ViewActivityStyle30Map.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/20/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit
import MapKit

class ViewActivityStyle30Map: UITableViewCell {
    
    @IBOutlet var map: MKMapView!
    @IBOutlet var label: UILabel!
    @IBOutlet var time: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        map.delegate = self as? MKMapViewDelegate
        
    }
    
    
    
}
