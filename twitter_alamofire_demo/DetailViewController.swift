//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Jiaqi He on 3/6/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var tweet: Tweet!
    
    
    @IBOutlet weak var userProfileImage: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var postTimeLabel: UILabel!
    
    @IBOutlet weak var retweetLabel: UILabel!
    
    @IBOutlet weak var favorLabel: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func updateData() {
        let profileImageURL = URL(string: tweet.user.profileImageURL)!
        userProfileImage.af_setImage(withURL: profileImageURL)
        usernameLabel.text = tweet.user.name
        userLabel.text = tweet.user.screenName
        postTimeLabel.text = tweet.createdAtString
        textLabel.text = tweet.text
        retweetLabel.text = String(tweet.retweetCount)
        let str = tweet.favoriteCount as! Int
        favorLabel.text = "\(str)"
        if tweet.retweeted == true {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControlState(rawValue: 0))
        } else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControlState(rawValue: 0))
        }
        if tweet.favorited == true {
            favorButton.setImage(UIImage(named: "favor-icon-red"), for: UIControlState(rawValue: 0))
        } else {
            favorButton.setImage(UIImage(named: "favor-icon"), for: UIControlState(rawValue: 0))
        }
    }
    
    @IBAction func didTapRetweet(_ sender: Any) {
        if(tweet.retweeted == false) {
            tweet.retweeted = true
            tweet.retweetCount += 1
            updateData()
            updateRetweetInDB(isRetweeted: false)
        }
        else {
            tweet.retweeted = false
            tweet.retweetCount -= 1
            updateData()
            updateRetweetInDB(isRetweeted: true)
        }
    }
    
    @IBAction func didTapLike(_ sender: Any) {
        if(tweet.favorited == false) {
            tweet.favorited = true
            tweet.favoriteCount! += 1
            updateData()
            updateFavorInDB(isFavored: false)
        }
        else {
            tweet.favorited = false
            tweet.favoriteCount! -= 1
            updateData()
            updateFavorInDB(isFavored: true)
        }
    }
    
    func updateFavorInDB(isFavored : Bool) {
        APIManager.shared.favorite(tweet, isFavored: isFavored) { (tweet: Tweet?, error: Error?) in
            if let  error = error {
                print("Error favoriting tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                print("Successfully favorited the following Tweet: \n\(tweet.text)")
            }
        }
    }
    
    func updateRetweetInDB(isRetweeted : Bool) {
        APIManager.shared.retweet(tweet, isRetweeted: isRetweeted) { (tweet: Tweet?, error: Error?) in
            if let  error = error {
                print("Error favoriting tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                print("Successfully favorited the following Tweet: \n\(tweet.text)")
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
}
