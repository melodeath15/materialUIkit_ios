//
//  PageControlStyle17.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class PageControlStyle17: UIViewController, WalkthroughStyle1FooterDelegate {
    
    var pageControll = UIPageControl() // var pagecontroller
    var footer = WalkthroughStyle1Footer() // var view xib in folder Walkthrough, style1, name WalkthroughStyle1Footer
    
    // create var delegate pageViewControllerStyle17
    var pageViewControllerStyle17: PageViewControllerStyle17? {
        didSet {
            pageViewControllerStyle17?.pageStyle17Delegate = self
        }
    }
    
    override func loadView() {
        super.loadView()
        
        createView() // call function for create footer, pagecontroll
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 45/255.0, green: 57/255.0, blue: 64/255.0, alpha: 1.0)
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("WalkthroughStyle1Footer", owner: nil, options: nil)?.first as! WalkthroughStyle1Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-60, width: self.view.frame.size.width, height: 50)
        footer.btnStarted.setTitle("GET STARTED", for: .normal)
        footer.delegate = self
        self.view.addSubview(footer)
        
        // Create Pagecontroll
        pageControll.frame = CGRect(x: 0, y: self.view.frame.size.height-120, width: self.view.frame.size.width, height: 20)
        pageControll.hidesForSinglePage = true
        pageControll.numberOfPages = 4
        pageControll.tintColor = UIColor.lightGray
        pageControll.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pageControll)
        
        pageControll.addTarget(self, action: #selector(PageControlStyle17.didChangePageControlValue), for: .valueChanged)
        
    }
    
    // func for segue storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let PageViewController = segue.destination as? PageViewControllerStyle17 {
            self.pageViewControllerStyle17 = PageViewController
        }
    }
    
    // func change pagecontroll
    func didChangePageControlValue() {
        pageViewControllerStyle17?.scrollToViewController(index: pageControll.currentPage)
    }
    
    
    // delegate WalkthroughStyle1FooterDelegate
    func started() { // func btn get stared
        FunctionDefault.AlertMessageAction(title: "Get Started", message: "", targetVC: self)
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

// func PageControlStyle17Delegate
extension PageControlStyle17: PageViewControllerStyle17Delegate {
    // func
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle17,
                            didUpdatePageCount count: Int) {
        pageControll.numberOfPages = count
    }
    
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle17,
                            didUpdatePageIndex index: Int) {
        pageControll.currentPage = index
    }
    
}
