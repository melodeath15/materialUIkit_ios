//
//  PageControlStyle11.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class PageControlStyle11: UIViewController, WalkthroughStyle8FooterDelegate {
    
    var pageControll = UIPageControl() // var pagecontroller
    var footer = WalkthroughStyle8Footer() // var view xib in folder Walkthrough, style8, name WalkthroughStyle8Footer
    
    // create var delegate pageViewControllerStyle11
    var pageViewControllerStyle11: PageViewControllerStyle11? {
        didSet {
            pageViewControllerStyle11?.pageStyle11Delegate = self
        }
    }
    
    override func loadView() {
        super.loadView()
        
        createView() // call function for create footer, pagecontroll
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 243/255.0, green: 246/255.0, blue: 249/255.0, alpha: 1.0)
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("WalkthroughStyle8Footer", owner: nil, options: nil)?.first as! WalkthroughStyle8Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-120, width: self.view.frame.size.width, height: 120)
        footer.btnSignUp.setTitle("SIGN UP", for: .normal)
        footer.btnSignIn.setTitle("SIGN IN", for: .normal)
        footer.btnFB.setTitle("Sign Up with Facebook", for: .normal)
        footer.delegate = self
        self.view.addSubview(footer)
        
        // Create Pagecontroll
        pageControll.frame = CGRect(x: 0, y: self.view.frame.size.height-220, width: self.view.frame.size.width, height: 20)
        pageControll.hidesForSinglePage = true
        pageControll.numberOfPages = 4
        pageControll.tintColor = UIColor.lightGray
        pageControll.currentPageIndicatorTintColor = UIColor.init(red: 231/255.0, green: 51/255.0, blue: 110/255.0, alpha: 1.0)
        pageControll.addTarget(self, action: #selector(PageControlStyle8.didChangePageControlValue), for: .valueChanged)
        self.view.addSubview(pageControll)
        
    }
    
    // func for segue storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let PageViewController = segue.destination as? PageViewControllerStyle11 {
            self.pageViewControllerStyle11 = PageViewController
        }
    }
    
    // func change pagecontroll
    func didChangePageControlValue() {
        pageViewControllerStyle11?.scrollToViewController(index: pageControll.currentPage)
    }
    
    // delegate WalkthroughStyle8FooterDelegate
    func SignIn() {// func btn sign in
        FunctionDefault.AlertMessageAction(title: "Sign In", message: "", targetVC: self)
    }
    
    func signUp() {// func btn sign up
        FunctionDefault.AlertMessageAction(title: "Sign Up", message: "", targetVC: self)
    }
    
    func facebook() {// func btn facebook
        FunctionDefault.AlertMessageAction(title: "Facebook", message: "", targetVC: self)
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

// func PageControlStyle11Delegate
extension PageControlStyle11: PageViewControllerStyle11Delegate {
    // func
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle11,
                            didUpdatePageCount count: Int) {
        pageControll.numberOfPages = count
    }
    
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle11,
                            didUpdatePageIndex index: Int) {
        pageControll.currentPage = index
    }
}
