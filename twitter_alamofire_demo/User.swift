//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/17/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import Foundation

class User {
    
    var name: String
    var screenName: String
    var profileImageURL: String
    var id: Int64
    var followers_count: Int
    var friends_count: Int
    var favorites_count: Int
    var profile_banner_url: String
    var statuses_count: Int
    
    static var current: User?
    
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as! String
        screenName = dictionary["screen_name"] as! String
        profileImageURL = dictionary["profile_image_url_https"] as! String
        id = dictionary["id"] as! Int64
        followers_count = dictionary["followers_count"] as! Int
        friends_count = dictionary["friends_count"] as! Int
        favorites_count = dictionary["favourites_count"] as! Int
        if let bannerURL = dictionary["profile_banner_url"] {
            profile_banner_url = bannerURL as! String
        } else {
            profile_banner_url = ""
        }
        statuses_count = dictionary["statuses_count"] as! Int
    }
}
