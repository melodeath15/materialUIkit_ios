//
//  PageControlStyle1.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/11/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class PageControlStyle1: UIViewController, WalkthroughStyle1FooterDelegate {
    
    var pageControll = UIPageControl() // var pagecontroller
    var header = WalkthroughStyle1Header() // var view xib in folder Walkthrough, style1, name WalkthroughStyle1Header
    var footer = WalkthroughStyle1Footer() // var view xib in folder Walkthrough, style1, name WalkthroughStyle1Footer

    // create var delegate pageViewControllerStyle1
    var pageViewControllerStyle1: PageViewControllerStyle1? {
        didSet {
            pageViewControllerStyle1?.pageStyle1Delegate = self
        }
    }
    
    override func loadView() {
        super.loadView()
        
        createView() // call function for create header, footer, pagecontroll
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        
        // Create Header
        header = Bundle.main.loadNibNamed("WalkthroughStyle1Header", owner: nil, options: nil)?.first as! WalkthroughStyle1Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80)
        header.btnMenu.isHidden = true
        header.title.text = "Welcome!"
        header.title.textColor = UIColor.darkText
        self.view.addSubview(header)
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("WalkthroughStyle1Footer", owner: nil, options: nil)?.first as! WalkthroughStyle1Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-60, width: self.view.frame.size.width, height: 50)
        footer.btnStarted.setTitle("STARTED", for: .normal)
        footer.delegate = self
        self.view.addSubview(footer)
        
        // Create PageControll
        pageControll.frame = CGRect(x: 0, y: self.view.frame.size.height-120, width: self.view.frame.size.width, height: 20)
        pageControll.hidesForSinglePage = true
        pageControll.numberOfPages = 4
        pageControll.tintColor = UIColor.lightGray
        pageControll.currentPageIndicatorTintColor = UIColor.init(red: 231/255.0, green: 51/255.0, blue: 110/255.0, alpha: 1.0)
        pageControll.addTarget(self, action: #selector(PageControlStyle1.didChangePageControlValue), for: .valueChanged)
        self.view.addSubview(pageControll)
    }
    
    // func for segue storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let PageViewController = segue.destination as? PageViewControllerStyle1 {
            self.pageViewControllerStyle1 = PageViewController
        }
    }
    
    // func change pagecontroll
    func didChangePageControlValue() {
        pageViewControllerStyle1?.scrollToViewController(index: pageControll.currentPage)
    }
    
    // delegate WalkthroughStyle1FooterDelegate
    func started() {// func btn started
        FunctionDefault.AlertMessageAction(title: "Started", message: "", targetVC: self)
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

// func PageControlStyle1Delegate
extension PageControlStyle1: PageViewControllerStyle1Delegate {

    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle1,
                            didUpdatePageCount count: Int) {
        pageControll.numberOfPages = count
    }
    
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle1,
                            didUpdatePageIndex index: Int) {
        pageControll.currentPage = index
    }
    
}
