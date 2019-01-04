//
//  PageControlStyle10.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class PageControlStyle10: UIViewController, WalkthroughStyle5FooterDelegate {
    
    var pageControll = UIPageControl() // var pagecontroller
    var footer = WalkthroughStyle5Footer() // var view xib in folder Walkthrough, style5, name WalkthroughStyle5Footer
    
    // create var delegate pageViewControllerStyle10
    var pageViewControllerStyle10: PageViewControllerStyle10? {
        didSet {
            pageViewControllerStyle10?.pageStyle10Delegate = self
        }
    }
    
    override func loadView() {
        super.loadView()
        
        createView() // call function for create footer, pagecontroll
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.white
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("WalkthroughStyle5Footer", owner: nil, options: nil)?.first as! WalkthroughStyle5Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width, height: 50)
        footer.btnGetStarted.setTitle("GET STARTED", for: .normal)
        footer.delegate = self
        self.view.addSubview(footer)
        
        // Create Pagecontroll
        pageControll.frame = CGRect(x: 0, y: self.view.frame.size.height-160, width: self.view.frame.size.width, height: 20)
        pageControll.hidesForSinglePage = true
        pageControll.numberOfPages = 4
        pageControll.tintColor = UIColor.lightGray
        pageControll.currentPageIndicatorTintColor = UIColor.init(red: 231/255.0, green: 51/255.0, blue: 110/255.0, alpha: 1.0)
        pageControll.addTarget(self, action: #selector(PageControlStyle10.didChangePageControlValue), for: .valueChanged)
        self.view.addSubview(pageControll)
        
    }
    
    // func for segue storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let PageViewController = segue.destination as? PageViewControllerStyle10 {
            self.pageViewControllerStyle10 = PageViewController
        }
    }
    
    // func change pagecontroll
    func didChangePageControlValue() {
        pageViewControllerStyle10?.scrollToViewController(index: pageControll.currentPage)
    }
    
    // delegate WalkthroughStyle5Footer
    func getStarted() {// func btn get started
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

// func PageControlStyle10Delegate
extension PageControlStyle10: PageViewControllerStyle10Delegate {
    // func
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle10,
                            didUpdatePageCount count: Int) {
        pageControll.numberOfPages = count
    }
    
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle10,
                            didUpdatePageIndex index: Int) {
        pageControll.currentPage = index
    }
    
}

