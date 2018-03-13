//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Jiaqi He on 3/12/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage


class ProfileViewController: UIViewController {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var numberOfTweets: UILabel!
    @IBOutlet weak var numberOfFollowing: UILabel!
    @IBOutlet weak var numberOfFollowers: UILabel!
    
    var user : User! {
        didSet {
            acquireUser()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        acquireUser()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        acquireUser()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func acquireUser() {
        if(User.current != nil) {
            APIManager.shared.getUserProfile(user_id: (User.current?.id)!, screen_name: (User.current?.screenName)!) { (user : User?, error : Error?) in
                if error != nil {
                    print(error?.localizedDescription)
                } else {
                    print("success")
                    if let profileImageURL = URL(string: user!.profileImageURL) {
                        self.avatarImage.af_setImage(withURL: profileImageURL)
                    }
                    if let bannerImageURL = URL(string: user!.profile_banner_url) {
                        self.bannerImage.af_setImage(withURL: bannerImageURL)
                    }
                    self.usernameLabel.text = user!.name
                    self.screennameLabel.text = user!.screenName
                    self.numberOfTweets.text = String(user!.statuses_count)
                    self.numberOfFollowing.text = String(user!.favorites_count)
                    self.numberOfFollowers.text = String(user!.followers_count)
                }
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
