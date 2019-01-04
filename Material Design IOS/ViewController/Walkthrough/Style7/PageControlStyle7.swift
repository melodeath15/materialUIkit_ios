//
//  PageControlStyle7.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class PageControlStyle7: UIViewController, WalkthroughStyle7FooterDelegate {
    
    var pageControll = UIPageControl() // var pagecontroller
    var footer = WalkthroughStyle7Footer() // var view xib in folder Walkthrough, style7, name WalkthroughStyle7Footer
    
    // create var delegate pageViewControllerStyle7
    var pageViewControllerStyle7: PageViewControllerStyle7? {
        didSet {
            pageViewControllerStyle7?.pageStyle7Delegate = self
        }
    }
    
    override func loadView() {
        super.loadView()
        
        createView() // call function for create footer, pagecontroll
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.white
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("WalkthroughStyle7Footer", owner: nil, options: nil)?.first as! WalkthroughStyle7Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-120, width: self.view.frame.size.width, height: 120)
        footer.btnSkip.setTitle("Skip", for: .normal)
        footer.btnSignIn.setTitle("Sign In", for: .normal)
        footer.delegate = self
        self.view.addSubview(footer)
        
        // Create Pagecontroll
        pageControll.frame = CGRect(x: 0, y: self.view.frame.size.height-170, width: self.view.frame.size.width, height: 20)
        pageControll.hidesForSinglePage = true
        pageControll.numberOfPages = 4
        pageControll.tintColor = UIColor.lightGray
        pageControll.currentPageIndicatorTintColor = UIColor.init(red: 231/255.0, green: 51/255.0, blue: 110/255.0, alpha: 1.0)
        pageControll.addTarget(self, action: #selector(PageControlStyle7.didChangePageControlValue), for: .valueChanged)
        self.view.addSubview(pageControll)
        
    }
    
    // func for segue storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let PageViewController = segue.destination as? PageViewControllerStyle7 {
            self.pageViewControllerStyle7 = PageViewController
        }
    }
    
    // func change pagecontroll
    func didChangePageControlValue() {
        pageViewControllerStyle7?.scrollToViewController(index: pageControll.currentPage)
    }
    
    // delegate WalkthroughStyle7FooterDelegate
    func signIn() { // func btn sign in
        FunctionDefault.AlertMessageAction(title: "Sign In", message: "", targetVC: self)
    }
    
    func skip() {// func btn skip
        FunctionDefault.AlertMessageAction(title: "Skip", message: "", targetVC: self)
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

// func PageControlStyle7Delegate
extension PageControlStyle7: PageViewControllerStyle7Delegate {
    // func
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle7,
                            didUpdatePageCount count: Int) {
        pageControll.numberOfPages = count
    }
    
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle7,
                            didUpdatePageIndex index: Int) {
        pageControll.currentPage = index
    }
}
