//
//  DataDefault.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 6/15/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class DataDefault: NSObject {
    
    var dataImageBg : [UIImage] = []
    var dataImageProfile : [UIImage] = []
    var dataImageBg2 : [UIImage] = []
    var dataImageProfile2 : [UIImage] = []

    let imageBg1 = UIImage(named: "As6.1")
    let imageBg2 = UIImage(named: "As6.2")
    let imageBg3 = UIImage(named: "As6.3")
    let imageBg4 = UIImage(named: "As6.4")
    let imageBg5 = UIImage(named: "As6.5")
    let imageBg6 = UIImage(named: "As6.6")
    
    let imageBg7 = UIImage(named: "As11.1")
    let imageBg8 = UIImage(named: "As11.2")
    let imageBg9 = UIImage(named: "As11.4")
    let imageBg10 = UIImage(named: "As11.3")
    
    let imageProfile1 = UIImage(named: "profile1")
    let imageProfile2 = UIImage(named: "profile2")
    let imageProfile3 = UIImage(named: "profile3")
    
    func createDataImageBg(){
        dataImageBg.append(imageBg1!)
        dataImageBg.append(imageBg2!)
        dataImageBg.append(imageBg3!)
        dataImageBg.append(imageBg4!)
        dataImageBg.append(imageBg5!)
        dataImageBg.append(imageBg6!)
    }
    
    func createDataImageProfile(){
        dataImageProfile.append(imageProfile1!)
        dataImageProfile.append(imageProfile2!)
        dataImageProfile.append(imageProfile3!)
        dataImageProfile.append(imageProfile1!)
        dataImageProfile.append(imageProfile2!)
        dataImageProfile.append(imageProfile3!)
    }
    
    func createDataImageBg2(){
        dataImageBg2.append(imageBg7!)
        dataImageBg2.append(imageBg8!)
        dataImageBg2.append(imageBg9!)
        dataImageBg2.append(imageBg10!)
    }

    func createDataImageProfile2(){
        dataImageProfile2.append(imageProfile1!)
        dataImageProfile2.append(imageProfile2!)
        dataImageProfile2.append(imageProfile3!)
        dataImageProfile2.append(imageProfile2!)
        dataImageProfile2.append(imageProfile1!)
    }
    

}
