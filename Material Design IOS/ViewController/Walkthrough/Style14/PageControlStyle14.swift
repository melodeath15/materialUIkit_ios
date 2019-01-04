//
//  PageControlStyle14.swift
//  Material Design IOS
//
//  Created by Denis Tirta Prada on 7/6/17.
//  Copyright © 2017 Mediatechindo. All rights reserved.
//

import UIKit

class PageControlStyle14: UIViewController, WalkthroughStyle1HeaderDelegate, WalkthroughStyle2FooterDelegate {
    
    var pageControll = UIPageControl() // var pagecontroller
    var header = WalkthroughStyle1Header() // var view xib in folder Walkthrough, style1, name WalkthroughStyle1Header
    var footer = WalkthroughStyle2Footer() // var view xib in folder Walkthrough, style2, name WalkthroughStyle2Footer
    
    // create var delegate pageViewControllerStyle14
    var pageViewControllerStyle14: PageViewControllerStyle14? {
        didSet {
            pageViewControllerStyle14?.pageStyle14Delegate = self
        }
    }
    
    override func loadView() {
        super.loadView()
        
        createView() // call function for create footer, pageControll
    }
    
    func createView(){
        self.view.backgroundColor = UIColor.init(red: 45/255.0, green: 57/255.0, blue: 67/255.0, alpha: 1.0)

        // Create Footer
        footer = Bundle.main.loadNibNamed("WalkthroughStyle2Footer", owner: nil, options: nil)?.first as! WalkthroughStyle2Footer
        footer.frame = CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width, height: 50)
        footer.btnSignUp.setTitle("SIGN UP", for: .normal)
        footer.btnSignIn.setTitle("SIGN IN", for: .normal)
        footer.delegate = self
        self.view.addSubview(footer)
        
        pageControll.frame = CGRect(x: 0, y: self.view.frame.size.height-190, width: self.view.frame.size.width, height: 20)
        pageControll.hidesForSinglePage = true
        pageControll.numberOfPages = 4
        pageControll.tintColor = UIColor.lightGray
        pageControll.currentPageIndicatorTintColor = UIColor.init(red: 231/255.0, green: 51/255.0, blue: 110/255.0, alpha: 1.0)
        pageControll.addTarget(self, action: #selector(PageControlStyle14.didChangePageControlValue), for: .valueChanged)
        self.view.addSubview(pageControll)
        
    }
    
    // func for segue storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let PageViewController = segue.destination as? PageViewControllerStyle14 {
            self.pageViewControllerStyle14 = PageViewController
        }
    }
    
    // func change pagecontroll
    func didChangePageControlValue() {
        pageViewControllerStyle14?.scrollToViewController(index: pageControll.currentPage)
    }
    
    // delegate WalkthroughStyle1HeaderDelegate
    func Menu() {
        navigationController?.popViewController(animated: true)
    }
    // end
    
    // delegate WalkthroughStyle2FooterDelegate
    func signIn(){// func btn sign in
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

// func PageControlStyle14Delegate
extension PageControlStyle14: PageViewControllerStyle14Delegate {
    // func
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle14,
                            didUpdatePageCount count: Int) {
        pageControll.numberOfPages = count
    }
    
    func PageViewController(_ tutorialPageViewController: PageViewControllerStyle14,
                            didUpdatePageIndex index: Int) {
        pageControll.currentPage = index
    }
    
}
