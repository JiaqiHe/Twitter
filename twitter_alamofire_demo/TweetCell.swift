//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage


class TweetCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var screen_name: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var replyLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var favorButton: UIButton!
    @IBOutlet weak var favorLabel: UILabel!
    
    
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
    
    
    
    func updateData() {
        let profileImageURL = URL(string: tweet.user.profileImageURL)!
        profileImage.af_setImage(withURL: profileImageURL)
        name.text = tweet.user.name
        screen_name.text = tweet.user.screenName
        createdAtLabel.text = tweet.createdAtString
        tweetContent.text = tweet.text
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
    
    var tweet: Tweet! {
        didSet {
            updateData()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
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
    
}
