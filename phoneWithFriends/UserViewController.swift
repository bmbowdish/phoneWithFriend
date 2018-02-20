//
//  UserViewController.swift
//  phoneWithFriends
//
//  Created by Braden Bowdish on 2/5/18.
//  Copyright © 2018 Braden Bowdish. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var friendsLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var profilesButton: UIButton!
    
    // sends data over to a target
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let data = pageController
        // sends back the change PageViewController
        if let MyPageViewController = segue.destination as? MyPageViewController {
            MyPageViewController.pageController = data!
        }
    }
    
    // the PageViewController (acts a little like a model)
    var pageController: MyPageViewController!
    
    // the person using the Application
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = pageController.user // copy the user over
        nameLabel.text = user?.name // set the label to their name
        ageLabel.text = "\(String(describing: user!.age)) years old." // age
        descriptionLabel.text = user?.description ?? "No description." // description
        friendsLabel.text = user?.getFriendStr() // friends
        locationLabel.text = user?.location // location
    }
}
