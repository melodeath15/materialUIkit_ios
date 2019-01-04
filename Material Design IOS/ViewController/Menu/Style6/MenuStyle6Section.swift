//
//  MenuStyle6Section.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/13/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import Foundation

struct Section {
    var title: String!
    var subTitle: [String]!
    var expanded: Bool!
    
    init(title: String, subTitle: [String], expanded: Bool) {
        self.title = title
        self.subTitle = subTitle
        self.expanded = expanded
    }
}
