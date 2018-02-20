//
//  ViewController.swift
//  phoneWithFriends
//
//  Created by Braden Bowdish on 2/4/18.
//  Copyright © 2018 Braden Bowdish. All rights reserved.
//

import UIKit

class MyPageViewController: UIPageViewController {
    
    // the PageViewController, usually self.
    var pageController : MyPageViewController?
    
    var numberOfPages: Int! // number of pages
    var persons: [Person]! // list of users
    var user: User! // the user
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // persons is created or already exists
        persons = pageController?.persons ?? Person.createPersons()
        
        // user is created or already exits
        user = pageController?.user ?? User.createMe()
        
        // number of pages is set to the number of persons (dynamic)
        numberOfPages = persons.count
        
        
        // gives an array of viewControllers which will be the pages
        setViewControllers([createViewController(pageNumber: 1)],
                           direction: .forward,
                           animated: false, 
                           completion: nil)
        
        dataSource = self
    }
    
    // created views programatically from data (persons)
    func createViewController(pageNumber: Int) -> UIViewController {
        // creates these stories as instances of MyContentViewControllers
        let contentViewController = 
            storyboard?.instantiateViewController(withIdentifier: "MyContentViewController")
                as! MyContentViewController
        
        contentViewController.pageNumber = pageNumber // gives it a page number
        contentViewController.pageController = self // gives it a copy of the pageview
        contentViewController.user = user // tells the view who the user is
        contentViewController.person = persons[pageNumber-1] // Assigns a person to the page who is of the correct number in list
        return contentViewController // send it back
    }
}

// this is what handles going from page to page and creates the view as you request to go to that page
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

// function to determine what page to go to
func mod(x: Int, m: Int) -> Int{
    let r = x % m
    return r < 0 ? r + m : r
}
