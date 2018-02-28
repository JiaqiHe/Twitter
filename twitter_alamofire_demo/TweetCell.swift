//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit


class TweetCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var screen_name: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var replyLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var favorLabel: UILabel!
    

    
    var tweet: Tweet! {
        didSet {
            name.text = tweet.user.name
            screen_name.text = tweet.user.screenName
            createdAtLabel.text = tweet.createdAtString
            tweetContent.text = tweet.text
            retweetLabel.text = String(tweet.retweetCount)
            let str = tweet.favoriteCount as! Int
            favorLabel.text = "\(str)"
            
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
