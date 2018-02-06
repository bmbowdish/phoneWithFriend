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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let data = pageController
        if let UserViewController = segue.destination as? UserViewController {
            UserViewController.pageController = data
        }
    }
    
    var pageController: MyPageViewController!
    
    var person: Person?
    
    var user: User?
    
    var pageNumber: Int!
    
    @IBAction func addFriendButton(){
        user?.addFriend(newFriend: person!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = pageController.user
        nameLabel.text = person?.name
        ageLabel.text = "\(person!.age) years old."
        descriptionLabel.text = person?.description ?? "No description."
        friendsLabel.text = person?.getFriendStr()
        locationLabel.text = person?.location
        //pageNumberLabel.text = "Page Number: \(pageNumber!)"
    }
}
