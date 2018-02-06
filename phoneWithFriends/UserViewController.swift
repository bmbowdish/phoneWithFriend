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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let data = pageController
        if let MyPageViewController = segue.destination as? MyPageViewController {
            MyPageViewController.pageController = data!
        }
    }
    
    var pageController: MyPageViewController!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = pageController.user
        nameLabel.text = user?.name
        ageLabel.text = "\(String(describing: user!.age)) years old."
        descriptionLabel.text = user?.description ?? "No description."
        friendsLabel.text = user?.getFriendStr()
        locationLabel.text = user?.location
    }
}
