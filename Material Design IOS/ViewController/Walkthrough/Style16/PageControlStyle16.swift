//
//  PageControlStyle16.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class PageControlStyle16: UIViewController, WalkthroughStyle16FooterDelegate {
    
    
    var pageControll = UIPageControl() // var pagecontroller
    var footer = WalkthroughStyle16Footer() // var view xib in folder Walkthrough, style16, name WalkthroughStyle16Footer
    
    // create var delegate pageViewControllerStyle16
    var pageViewControllerStyle16: PageViewControllerStyle16? {
        didSet {
            pageViewControllerStyle16?.pageStyle16Delegate = self
        }
    }
    
    override func loadView() {
        super.loadView()
        
        createView() // call function for create footer, pagecontroll
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 45/255.0, green: 57/255.0, blue: 67/255.0, alpha: 1.0)
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("WalkthroughStyle16Footer", owner: nil, options: nil)?.first as! WalkthroughStyle16Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-125, width: self.view.frame.size.width, height: 40)
        footer.btnStarted.setTitle("GET STARTED", for: .normal)
        footer.delegate = self
        self.view.addSubview(footer)
        
        // Create Pagecontroll
        pageControll.frame = CGRect(x: 0, y: self.view.frame.size.height-160, width: self.view.frame.size.width, height: 10)
        pageControll.hidesForSinglePage = true
        pageControll.numberOfPages = 4
        pageControll.tintColor = UIColor.lightGray
        pageControll.currentPageIndicatorTintColor = UIColor.init(red: 231/255.0, green: 51/255.0, blue: 110/255.0, alpha: 1.0)
        pageControll.addTarget(self, action: #selector(PageControlStyle15.didChangePageControlValue), for: .valueChanged)
        self.view.addSubview(pageControll)
        
    }
    
    // func for segue storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let PageViewController = segue.destination as? PageViewControllerStyle16 {
            self.pageViewControllerStyle16 = PageViewController
        }
    }
    
    // func change pagecontroll
    func didChangePageControlValue() {
        pageViewControllerStyle16?.scrollToViewController(index: pageControll.currentPage)
    }
    
    
    // delegate WalkthroughStyle16FooterDelegate
    func started() {// func btn started
        FunctionDefault.AlertMessageAction(title: "Get Stared", message: "", targetVC: self)
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

// func PageControlStyle16Delegate
extension PageControlStyle16: PageViewControllerStyle16Delegate {
    // func
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle16,
                            didUpdatePageCount count: Int) {
        pageControll.numberOfPages = count
    }
    
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle16,
                            didUpdatePageIndex index: Int) {
        pageControll.currentPage = index
    }
}
