//
//  User.swift
//  phoneWithFriends
//
//  Created by Braden Bowdish on 2/4/18.
//  Copyright © 2018 Braden Bowdish. All rights reserved.
//

import Foundation

class User: Person {
    override init(firstName: String, lastName: String, age: Int, description: String?, friends: [Person], location: String) {
        super.init(firstName: firstName, lastName: lastName, age: age, description: description, friends: friends, location: location)
    }
    
    static func createMe() -> User // fake current User
    {
        return User(firstName: "Colin", lastName: "Bowdish", age: 17, description: "I am Colin, Braden's Brother.", friends: [], location: "Phoenixville, PA")
    }
}
