//
//  PageControlStyle18.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class PageControlStyle18: UIViewController, WalkthroughStyle15FooterDelegate {
    
    var pageControll = UIPageControl() // var pagecontroller
    var footer = WalkthroughStyle15Footer() // var view xib in folder Walkthrough, style15, name WalkthroughStyle15Footer
    
    // create var delegate pageViewControllerStyle18
    var pageViewControllerStyle18: PageViewControllerStyle18? {
        didSet {
            pageViewControllerStyle18?.pageStyle18Delegate = self
        }
    }
    
    override func loadView() {
        super.loadView()
        
        createView() // call function for create footer, pagecontroll
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        
        // Create Pagecontroll
        pageControll.frame = CGRect(x: 0, y: self.view.frame.size.height-30, width: self.view.frame.size.width, height: 10)
        pageControll.hidesForSinglePage = true
        pageControll.numberOfPages = 4
        pageControll.tintColor = UIColor.lightGray
        pageControll.currentPageIndicatorTintColor = UIColor.init(red: 231/255.0, green: 51/255.0, blue: 110/255.0, alpha: 1.0)
        pageControll.addTarget(self, action: #selector(PageControlStyle18.didChangePageControlValue), for: .valueChanged)
        self.view.addSubview(pageControll)
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("WalkthroughStyle15Footer", owner: nil, options: nil)?.first as! WalkthroughStyle15Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width, height: 50)
        footer.btnSignUp.setTitle("SKIP", for: .normal)
        footer.btnSignUp.setTitleColor(UIColor.black, for: .normal)
        footer.btnSignIn.setTitle("SIGN IN", for: .normal)
        footer.delegate = self
        self.view.addSubview(footer)
    }
    
    // func for segue storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let PageViewController = segue.destination as? PageViewControllerStyle18 {
            self.pageViewControllerStyle18 = PageViewController
        }
    }
    
    // func change pagecontroll
    func didChangePageControlValue() {
        pageViewControllerStyle18?.scrollToViewController(index: pageControll.currentPage)
    }
    
    // delegate WalkthroughStyle5Footer
    func signIn() {// func btn sign in
        FunctionDefault.AlertMessageAction(title: "Sign In", message: "", targetVC: self)
    }
    func signUp() {
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

// func PageControlStyle18Delegate
extension PageControlStyle18: PageViewControllerStyle18Delegate {
    // func
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle18,
                            didUpdatePageCount count: Int) {
        pageControll.numberOfPages = count
    }
    
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle18,
                            didUpdatePageIndex index: Int) {
        pageControll.currentPage = index
    }
    
}
