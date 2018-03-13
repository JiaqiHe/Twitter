//
//  NewTweetViewController.swift
//  twitter_alamofire_demo
//
//  Created by Jiaqi He on 3/6/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import RSKPlaceholderTextView

class NewTweetViewController: UIViewController {
    
    var user : User!
    
    var delegate: NewTweetViewControllerDelegate?
    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userScreenNameLabel: UILabel!
    @IBOutlet weak var textField: RSKPlaceholderTextView!
    
    @IBAction func didTapTweet(_ sender: UIBarButtonItem) {
//        var textStorage: NSTextStorage { get }
        let text = textField.text
        APIManager.shared.composeTweet(with: text!) { (tweet : Tweet?, error : Error?) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                print("success")
                self.delegate!.did(post: tweet!)
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        textField.delegate = self
        showUser()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showUser(){
        self.user = User.current
        if let profileImageURL = URL(string: user.profileImageURL) {
            userProfileImage.af_setImage(withURL: profileImageURL)
        }
        usernameLabel.text = user.name
        userScreenNameLabel.text = user.screenName
    }
    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        // TODO: Check the proposed new text character count
//        // Allow or disallow the new text
//        // Set the max character limit
//        let characterLimit = 140
//
//        // Construct what the new text would be if we allowed the user's latest edit
//        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
//
//        // TODO: Update Character Count Label
//
//        // The new text should be allowed? True/False
//        return newText.characters.count < characterLimit
//    }
    
//    func showUser(){
//        APIManager.shared.getCurrentAccount(completion: { (user : User?, error : Error?) in
//            if((error) != nil) {
//                print(error?.localizedDescription)
//            } else {
//                self.user = user
//            }
//        })
//        print(user.name)
//        if let profileImageURL = URL(string: user.profileImageURL) {
//            userProfileImage.af_setImage(withURL: profileImageURL)
//        }
//        usernameLabel.text = user.name
//        userScreenNameLabel.text = user.screenName
//    }
 

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol NewTweetViewControllerDelegate {
    func did(post: Tweet)
}

