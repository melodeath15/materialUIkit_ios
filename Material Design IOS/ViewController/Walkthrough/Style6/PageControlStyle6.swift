//
//  PageControlStyle6.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class PageControlStyle6: UIViewController, WalkthroughStyle1HeaderDelegate {
    
    var header = WalkthroughStyle1Header() // var view xib in folder Walkthrough, style1, name WalkthroughStyle1Header
    var footer = WalkthroughStyle6Footer() // var view xib in folder Walkthrough, style6, name WalkthroughStyle6Footer
    
    // create var delegate pageViewControllerStyle3
    var pageViewControllerStyle6: PageViewControllerStyle6? {
        didSet {
            pageViewControllerStyle6?.pageStyle6Delegate = self
        }
    }
    
    override func loadView() {
        super.loadView()
        
        createView() // call function for create header, footer
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        
        // Create Header
        header = Bundle.main.loadNibNamed("WalkthroughStyle1Header", owner: nil, options: nil)?.first as! WalkthroughStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.btnMenu.isHidden = false
        header.title.text = "Welcome"
        header.title.textColor = UIColor.white
        header.backgroundColor = UIColor.init(red: 231/255.0, green: 51/255.0, blue: 110/255.0, alpha: 1.0)
        
        // function show or close menu left
        header.btnMenu.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        revealViewController().rearViewRevealWidth = self.view.frame.size.width/1.2
        view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        header.delegate = self
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        self.view.addSubview(header)
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("WalkthroughStyle6Footer", owner: nil, options: nil)?.first as! WalkthroughStyle6Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-100, width: self.view.frame.size.width, height: 100)
        footer.des.text = "Making Friends is easy as waving your hand back and forth"
        self.view.addSubview(footer)

    }
    
    // func for segue storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let PageViewController = segue.destination as? PageViewControllerStyle6 {
            self.pageViewControllerStyle6 = PageViewController
        }
    }
    
    // delegate WalkthroughStyle1HeaderDelegate
    func Menu() {
        navigationController?.popViewController(animated: true)
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

// func PageControlStyle6Delegate
extension PageControlStyle6: PageViewControllerStyle6Delegate {
    // func
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle6,
                            didUpdatePageCount count: Int) {
    }
    
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle6,
                            didUpdatePageIndex index: Int) {
    }
}
