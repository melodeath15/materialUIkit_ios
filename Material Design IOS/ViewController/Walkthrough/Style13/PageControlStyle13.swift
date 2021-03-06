//
//  PageControlStyle13.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class PageControlStyle13: UIViewController, WalkthroughStyle1HeaderDelegate, WalkthroughStyle4FooterDelegate {
    
    var pageControll = UIPageControl() // var pagecontroller
    var header = WalkthroughStyle1Header() // var view xib in folder Walkthrough, style1, name WalkthroughStyle1Header
    var footer = WalkthroughStyle4Footer() // var view xib in folder Walkthrough, style4, name WalkthroughStyle4Footer
    
    // create var delegate pageViewControllerStyle13
    var pageViewControllerStyle13: PageViewControllerStyle13? {
        didSet {
            pageViewControllerStyle13?.pageStyle13Delegate = self
        }
    }
    
    override func loadView() {
        super.loadView()
        
        createView() // call function for create footer, pagecontroll
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 45/255.0, green: 57/255.0, blue: 67/255.0, alpha: 1.0)
        
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
        self.view.addSubview(header)
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("WalkthroughStyle4Footer", owner: nil, options: nil)?.first as! WalkthroughStyle4Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width, height: 50)
        footer.btnSignUp.setTitle("SIGN UP", for: .normal)
        footer.btnSignIn.setTitle("SIGN IN", for: .normal)
        footer.delegate = self
        self.view.addSubview(footer)
        
        // Create Pagecontroll
        pageControll.frame = CGRect(x: 0, y: self.view.frame.size.height-190, width: self.view.frame.size.width, height: 20)
        pageControll.hidesForSinglePage = true
        pageControll.numberOfPages = 4
        pageControll.tintColor = UIColor.lightGray
        pageControll.currentPageIndicatorTintColor = UIColor.init(red: 231/255.0, green: 51/255.0, blue: 110/255.0, alpha: 1.0)
        pageControll.addTarget(self, action: #selector(PageControlStyle13.didChangePageControlValue), for: .valueChanged)
        self.view.addSubview(pageControll)
        
    }
    
    // func for segue storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let PageViewController = segue.destination as? PageViewControllerStyle13 {
            self.pageViewControllerStyle13 = PageViewController
        }
    }
    
    // func change pagecontroll
    func didChangePageControlValue() {
        pageViewControllerStyle13?.scrollToViewController(index: pageControll.currentPage)
    }
    
    // delegate WalkthroughStyle1HeaderDelegate
    func Menu() {
        navigationController?.popViewController(animated: true)
    }
    // end
    
    // delegate WalkthroughStyle4FooterDelegate
    func SignIn() { // func btn sign in
        FunctionDefault.AlertMessage(title: "Sign In", message: "", targetVC: self)
    }
    
    func signUp() { // func btn sign up
        FunctionDefault.AlertMessage(title: "Sign Up", message: "", targetVC: self)
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

// func PageControlStyle13Delegate
extension PageControlStyle13: PageViewControllerStyle13Delegate {
    // func
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle13,
                            didUpdatePageCount count: Int) {
        pageControll.numberOfPages = count
    }
    
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle13,
                            didUpdatePageIndex index: Int) {
        pageControll.currentPage = index
    }
    
}
