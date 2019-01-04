//
//  PageControlStyle9.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class PageControlStyle9: UIViewController, WalkthroughStyle2FooterDelegate {
    
    var pageControll = UIPageControl() // var pagecontroller
    var footer = WalkthroughStyle2Footer() // var view xib in folder Walkthrough, style2, name WalkthroughStyle2Footer
    
    // create var delegate pageViewControllerStyle9
    var pageViewControllerStyle9: PageViewControllerStyle9? {
        didSet {
            pageViewControllerStyle9?.pageStyle9Delegate = self
        }
    }
    
    override func loadView() {
        super.loadView()
        
        createView() // call function for create footer, pagecontroll
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 231/255.0, green: 51/255.0, blue: 110/255.0, alpha: 1.0)
        
        // Create Footer
        footer = Bundle.main.loadNibNamed("WalkthroughStyle2Footer", owner: nil, options: nil)?.first as! WalkthroughStyle2Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-60, width: self.view.frame.size.width, height: 50)
        footer.btnSignUp.setTitle("SIGN UP", for: .normal)
        
        footer.btnSignIn.setTitle("SIGN IN", for: .normal)
        footer.btnSignIn.backgroundColor = UIColor.white
        
        let myColor : UIColor = UIColor.lightGray
        footer.btnSignIn.layer.borderColor = myColor.cgColor
        footer.btnSignIn.layer.borderWidth = 0.5
        footer.btnSignIn.clipsToBounds = true
        
        footer.btnSignIn.setTitleColor(UIColor.black, for: .normal)
        
        footer.delegate = self
        self.view.addSubview(footer)
        
        // Create Pagecontroll
        pageControll.frame = CGRect(x: 0, y: self.view.frame.size.height-120, width: self.view.frame.size.width, height: 20)
        pageControll.hidesForSinglePage = true
        pageControll.numberOfPages = 4
        pageControll.tintColor = UIColor.lightGray
        pageControll.currentPageIndicatorTintColor = UIColor.white
        pageControll.addTarget(self, action: #selector(PageControlStyle3.didChangePageControlValue), for: .valueChanged)
        self.view.addSubview(pageControll)
        
    }
    
    // func for segue storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let PageViewController = segue.destination as? PageViewControllerStyle9 {
            self.pageViewControllerStyle9 = PageViewController
        }
    }
    
    // func change pagecontroll
    func didChangePageControlValue() {
        pageViewControllerStyle9?.scrollToViewController(index: pageControll.currentPage)
    }
    
    // delegate WalkthroughStyle2FooterDelegate
    func signIn() { // func btn sign in
        FunctionDefault.AlertMessageAction(title: "Sign In", message: "", targetVC: self)
    }
    
    func signUp() { // func btn sign up
        FunctionDefault.AlertMessageAction(title: "Sign Up", message: "", targetVC: self)
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

// func PageControlStyle9Delegate
extension PageControlStyle9: PageViewControllerStyle9Delegate {
    // func
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle9,
                            didUpdatePageCount count: Int) {
        pageControll.numberOfPages = count
    }
    
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle9,
                            didUpdatePageIndex index: Int) {
        pageControll.currentPage = index
    }
    
}
