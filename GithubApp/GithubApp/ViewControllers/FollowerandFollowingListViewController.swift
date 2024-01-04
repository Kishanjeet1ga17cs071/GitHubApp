//
//  FollowerandFollowingListViewController.swift
//  GithubApp
//
//  Created by Kishanjeet, Kishanjeet on 04/01/24.
//

import UIKit

class FollowerandFollowingListViewController: UIViewController {
    

    
    @IBOutlet weak var tableView: UITableView!
    
    var list:[Follwer]!
    var viewModelUser1 = UserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelUser1.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        let textFieldCell = UINib(nibName: "ListTableViewCell",
                                      bundle: nil)
        self.tableView.register(textFieldCell,
                                    forCellReuseIdentifier: "ListTableViewCell")
        // Do any additional setup after loading the view.
    }


  

}

extension FollowerandFollowingListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as? ListTableViewCell
              
        cell?.listLabel.text = list[indexPath.row].login
      //  cell.textLabel?.text = list[indexPath.row].login
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModelUser1.getTrendingMovies(text: list[indexPath.row].login)
        
     
        
        
        
    
//        let secondVC = UserDetailsViewController()
//        secondVC.userDetails = userData
//        self.navigationController?.pushViewController(secondVC, animated: true)
    }

    
    
    
    
}

extension FollowerandFollowingListViewController : DeveloperEntryDelegate {
    func FetchUser(data: User) {
        let secondVC = UserDetailsViewController()
        secondVC.userDetails = data
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
        
    }
    
    
}
