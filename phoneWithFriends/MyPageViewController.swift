//
//  ViewController.swift
//  phoneWithFriends
//
//  Created by Braden Bowdish on 2/4/18.
//  Copyright © 2018 Braden Bowdish. All rights reserved.
//

import UIKit

class MyPageViewController: UIPageViewController {
    
    
    var pageController : MyPageViewController?
    
    var numberOfPages = 4
    var persons: [Person]!// = Person.createPersons() // list of fake users
    var user = User.createMe() // a fake
    
    override func viewDidLoad() {
        super.viewDidLoad()
        persons = pageController?.persons ?? Person.createPersons()
        user = pageController?.user ?? User.createMe()
        setViewControllers([createViewController(pageNumber: 1)],
                           direction: .forward,
                           animated: false, 
                           completion: nil)
        
        dataSource = self
    }
    
    func createViewController(pageNumber: Int) -> UIViewController {
        let contentViewController = 
            storyboard?.instantiateViewController(withIdentifier: "MyContentViewController")
                as! MyContentViewController
        contentViewController.pageNumber = pageNumber
        contentViewController.pageController = self
        contentViewController.user = user // assigns the user to a fake account
        contentViewController.person = persons[pageNumber-1] // Assigns a fake user to a page.
        return contentViewController
    }
    
    //func morePages(){
        //numberOfPages = numberOfPages + 1
    //}
}

extension MyPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return createViewController(
            pageNumber: mod(x: (viewController as! MyContentViewController).pageNumber,
                            m: numberOfPages) + 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return createViewController(
            pageNumber: mod(x: (viewController as! MyContentViewController).pageNumber - 2,
                            m: numberOfPages) + 1)
    }
}

func mod(x: Int, m: Int) -> Int{
    let r = x % m
    return r < 0 ? r + m : r
}
