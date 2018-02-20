//
//  PersonViewController.swift
//  phoneWithFriends
//
//  Created by Braden Bowdish on 2/4/18.
//  Copyright © 2018 Braden Bowdish. All rights reserved.
//

import UIKit

class MyContentViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var friendsLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var friendButton: UIButton!
    @IBOutlet var pageNumberLabel: UILabel!
    
    // sends data to the pageController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let data = pageController
        // sends off the page view to the User page
        if let UserViewController = segue.destination as? UserViewController {
            UserViewController.pageController = data
        }
    }
    
    // the pageViewController
    var pageController: MyPageViewController!
    
    // the person who this page is about
    var person: Person?
    
    // the user who is viewing this page and using this app
    var user: User?
    
    // the page number of this page
    var pageNumber: Int!
    
    // adds the person as a friend
    @IBAction func addFriendButton(){
        user?.addFriend(newFriend: person!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = pageController.user // the user viewing this page is the user in the pageView
        nameLabel.text = person?.name // label is set to the persons name
        ageLabel.text = "\(person!.age) years old." // age
        descriptionLabel.text = person?.description ?? "No description." // if they have a description present it
        friendsLabel.text = person?.getFriendStr() // show friends list, getFriendStr() handles null case
        locationLabel.text = person?.location // location
    }
}
