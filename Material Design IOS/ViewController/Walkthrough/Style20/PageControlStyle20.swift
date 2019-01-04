//
//  PageControlStyle20.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class PageControlStyle20: UIViewController, WalkthroughStyle1FooterDelegate, WalkthroughStyle20HeaderDelegate {
    
    var pageControll = UIPageControl() // var pagecontroller
    var header = WalkthroughStyle20Header() // var view xib in folder Walkthrough, style20, name WalkthroughStyle20Header
    var footer = WalkthroughStyle1Footer() // var view xib in folder Walkthrough, style1, name WalkthroughStyle1Footer
    
    // create var delegate pageViewControllerStyle20
    var pageViewControllerStyle20: PageViewControllerStyle20? {
        didSet {
            pageViewControllerStyle20?.pageStyle20Delegate = self
        }
    }
    
    override func loadView() {
        super.loadView()
        
        createView() // call function for create header, footer, pagecontroller
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        
        // Create Header
        header = Bundle.main.loadNibNamed("WalkthroughStyle20Header", owner: nil, options: nil)?.first as! WalkthroughStyle20Header
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 70)
        header.delegate = self
        self.view.addSubview(header)
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("WalkthroughStyle1Footer", owner: nil, options: nil)?.first as! WalkthroughStyle1Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-70, width: self.view.frame.size.width, height: 50)
        footer.btnStarted.setTitle("GET STARTED", for: .normal)
        footer.delegate = self
        self.view.addSubview(footer)
        
        // Create Pagecontroll
        pageControll.frame = CGRect(x: 0, y: self.view.frame.size.height-120, width: self.view.frame.size.width, height: 20)
        pageControll.hidesForSinglePage = true
        pageControll.numberOfPages = 4
        pageControll.tintColor = UIColor.lightGray
        pageControll.currentPageIndicatorTintColor = UIColor.init(red: 231/255.0, green: 51/255.0, blue: 110/255.0, alpha: 1.0)
        pageControll.addTarget(self, action: #selector(PageControlStyle20.didChangePageControlValue), for: .valueChanged)
        self.view.addSubview(pageControll)
        
    }
    
    // func for segue storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let PageViewController = segue.destination as? PageViewControllerStyle20 {
            self.pageViewControllerStyle20 = PageViewController
        }
    }
    
    // func change pagecontroll
    func didChangePageControlValue() {
        pageViewControllerStyle20?.scrollToViewController(index: pageControll.currentPage)
    }
    
    // delegate WalkthroughStyle1FooterDelegate
    func started() { // func btn get started
        FunctionDefault.AlertMessageAction(title: "Get Started", message: "", targetVC: self)
    }
    // end
    
    // delegate WalkthroughStyle20HeaderDelegate
    func close() {
        FunctionDefault.AlertMessageAction(title: "Close", message: "", targetVC: self)
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

// func PageControlStyle20Delegate
extension PageControlStyle20: PageViewControllerStyle20Delegate {
    // func
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle20,
                            didUpdatePageCount count: Int) {
        pageControll.numberOfPages = count
    }
    
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle20,
                            didUpdatePageIndex index: Int) {
        pageControll.currentPage = index
    }
    
}
