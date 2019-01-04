//
//  FunctionDefault.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 5/24/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

let baseAssetProfile = "https://s3-ap-southeast-1.amazonaws.com/ios-material/Profile/"
let baseAssetGallery = "https://s3-ap-southeast-1.amazonaws.com/ios-material/Gallery/"

// this class for function global in app Material Design IOS
class FunctionDefault {
    
    
    // Function Alert Message
    static func AlertMessage(title: String, message: String, targetVC: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        targetVC.present(alert, animated: true, completion: nil)
    }
    
    // Function Alert Message Action
    static func AlertMessageAction(title: String, message: String, targetVC: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Back", style: UIAlertActionStyle.destructive) { (action) in
            targetVC.navigationController?.popViewController(animated: true)
        })

        targetVC.present(alert, animated: true, completion: nil)
    }
    
    // Function Convert Time
    static func secondsToHoursMinutesSeconds (seconds : Int) -> (String) {
        var jam = ""
        var menit = ""
        var detik = ""
        
        if seconds / 3600 == 0{
            jam = ""
        }else{
            if seconds / 3600 < 10{
                jam = "0\(seconds / 3600)."
            }else{
                jam = "\(seconds / 3600)."
            }
        }
        
        if (seconds % 3600) / 60 < 10{
            menit = "0\((seconds % 3600) / 60)."
        }else{
            menit = "0\((seconds % 3600) / 60)."
        }
        
        if (seconds % 3600) % 60 < 10{
            detik = "0\((seconds % 3600) % 60)"
        }else{
            detik = "\((seconds % 3600) % 60)"
        }
        
        return "\(jam)\(menit)\(detik)"
    }
}

extension String {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: Data(utf8), options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}





