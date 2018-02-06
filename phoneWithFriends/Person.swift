//
//  Person.swift
//  phoneWithFriends
//
//  Created by Braden Bowdish on 2/4/18.
//  Copyright © 2018 Braden Bowdish. All rights reserved.
//

import Foundation

class Person {
    var firstName: String
    var lastName: String
    var age: Int
    var description: String?
    var friends: [Person]
    var location: String
    
    var name: String {
        return "\(firstName) \(lastName)"
    }
    
    init(firstName: String, lastName: String, age: Int, description: String?, friends: [Person], location: String){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.description = description
        self.friends = []
        self.location = location
    }
    
    func addFriend(newFriend: Person){
        for friend in friends{
            if(friend === newFriend){
                return
            }
        }
        friends.append(newFriend)
        newFriend.addFriend(newFriend: self)
    }
    
    static func createPersons() -> [Person] // array of persons created
    {
        // a test
        let newPersons = [Person(firstName: "Bob",lastName: "El Papo",age: 91,description: nil, friends: [],location: "Philadelphia, PA"),
                        Person(firstName: "Braden",lastName: "Bowdish",age:21,description: nil, friends: [],location: "Rochester, NY"),
                        Person(firstName: "Kyle", lastName: "Smith",age:10,description: nil, friends: [], location: "Phoenixville, PA"),
                        Person(firstName: "Meghan", lastName: "Nopalopalus",age:24,description:nil,friends:[],location:"San Francisco, CA")
        ]
        return newPersons
    }
    
    func getFriendStr() -> String{
        var str = ""
        if (friends.count > 3) {
            return "\(self.firstName) has \(friends.count) friends."
        }
        else if(friends.count > 0){
            for friend in friends{
                str = str + "\(friend.name) "
            }
            return str
        }
        else {
            return "No friends."
        }
    }
}
