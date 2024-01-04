//
//  UserDetailsViewController.swift
//  GithubApp
//
//  Created by Kishanjeet, Kishanjeet on 04/01/24.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Follower: UILabel!
    @IBOutlet weak var Following: UILabel!
    @IBOutlet weak var followerButton: UIButton!
    @IBOutlet weak var followingButton: UIButton!
    
    var userDetails : User!
    var FolloweList : [Follwer]!
    var FollowingList: [Follwer]!
    var userDetailsViewModel = UserDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDetailsViewModel.delegate = self
        if((userDetails.login == nil)||userDetails.name == nil) {
            self.userName.text = "No Data Found"
            self.avatarImage.isHidden = true
            self.Name.isHidden = true
            self.Follower.isHidden = true
            self.Following.isHidden = true
            self.followerButton.isHidden = true
            self.followingButton.isHidden = true
            
        }
        else {
            self.userName.text = "Username: " + userDetails.login!
            self.Name.text =  "Name: " + userDetails.name!
            print(userDetails.followers_url)
            DispatchQueue.global(qos: .background).async {
                do{
                    let data = try Data.init(contentsOf: URL.init(string:self.userDetails.avatar_url!)!)
                    DispatchQueue.main.async {
                        let image: UIImage? = UIImage(data: data)
                        self.avatarImage.image = image
                    }
                }
                catch let errorLog {
                    debugPrint(errorLog.localizedDescription)
                }
            }
            
            self.Follower.text = "Follower: " + userDetails.followers!.description
            self.Following.text = "Following " + userDetails.following!.description
        }
        
        
    }
    
    @IBAction func folloerList(_ sender: Any) {
        
        userDetailsViewModel.getFollowers(text: userDetails.followers_url!)
        
    }
    
    
    @IBAction func followingList(_ sender: Any) {
        print(userDetails.following_url as Any)
        userDetailsViewModel.getFollowing(text: userDetails.login!)
    }
    
    
    
    
}
extension UserDetailsViewController : DeveloperEntrySecondDelegate {
    
    func FetchList(data: [Follwer]) {
        DispatchQueue.main.async {
            let ThirdVc  = FollowerandFollowingListViewController()
            ThirdVc.list = data
            self.navigationController?.pushViewController(ThirdVc, animated: true)
        }
    }
    
    
    
    
}
