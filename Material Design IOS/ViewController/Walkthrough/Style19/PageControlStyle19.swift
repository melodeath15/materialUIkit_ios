//
//  PageControlStyle19.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class PageControlStyle19: UIViewController, WalkthroughStyle5FooterDelegate {
    
    var pageControll = UIPageControl() // var pagecontroller
    var header = WalkthroughStyle1Header() // var view xib in folder Walkthrough, style1, name WalkthroughStyle1Header
    var footer = WalkthroughStyle5Footer() // var view xib in folder Walkthrough, style5, name WalkthroughStyle5Footer
    
    // create var delegate pageViewControllerStyle19
    var pageViewControllerStyle19: PageViewControllerStyle19? {
        didSet {
            pageViewControllerStyle19?.pageStyle19Delegate = self
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
        header.title.textColor = UIColor.black
        self.view.addSubview(header)
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("WalkthroughStyle5Footer", owner: nil, options: nil)?.first as! WalkthroughStyle5Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width, height: 50)
        footer.btnGetStarted.setTitle("Continue", for: .normal)
        footer.btnGetStarted.setTitleColor(UIColor.black, for: .normal)
        footer.btnGetStarted.backgroundColor = UIColor.white
        footer.delegate = self
        self.view.addSubview(footer)
        
        // Create Pagecontroll
        pageControll.frame = CGRect(x: 0, y: self.view.frame.size.height-100, width: self.view.frame.size.width, height: 20)
        pageControll.hidesForSinglePage = true
        pageControll.numberOfPages = 4
        pageControll.tintColor = UIColor.lightGray
        pageControll.currentPageIndicatorTintColor = UIColor.init(red: 231/255.0, green: 51/255.0, blue: 110/255.0, alpha: 1.0)
        pageControll.addTarget(self, action: #selector(PageControlStyle19.didChangePageControlValue), for: .valueChanged)
        self.view.addSubview(pageControll)
        
    }
    
    // func for segue storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let PageViewController = segue.destination as? PageViewControllerStyle19 {
            self.pageViewControllerStyle19 = PageViewController
        }
    }
    
    // func change pagecontroll
    func didChangePageControlValue() {
        pageViewControllerStyle19?.scrollToViewController(index: pageControll.currentPage)
    }
    
    // delegate WalkthroughStyle5Footer
    func getStarted() {// func btn get started
        FunctionDefault.AlertMessageAction(title: "Continue", message: "", targetVC: self)
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

// func PageControlStyle19Delegate
extension PageControlStyle19: PageViewControllerStyle19Delegate {
    // func
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle19,
                            didUpdatePageCount count: Int) {
        pageControll.numberOfPages = count
    }
    
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle19,
                            didUpdatePageIndex index: Int) {
        pageControll.currentPage = index
    }
    
}

