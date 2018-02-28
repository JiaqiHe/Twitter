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
    
    
   
    
    
    var tweet: Tweet! {
        didSet {
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
                retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControlState(rawValue: 1))
            } else {
                retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControlState(rawValue: 0))
            }
            if tweet.favorited == true {
                favorButton.setImage(UIImage(named: "favor-icon-red"), for: UIControlState(rawValue: 1))
            } else {
                favorButton.setImage(UIImage(named: "favor-icon"), for: UIControlState(rawValue: 0))
            }
            
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
    
    
    
    
}
