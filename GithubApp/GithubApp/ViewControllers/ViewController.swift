//
//  ViewController.swift
//  GithubApp
//
//  Created by Kishanjeet, Kishanjeet on 04/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textBar: UITextField!
    
    
    let carData = ["Ford", "Mercedes", "Audi", "BMW", "Lamborghini", "Ferrari"]
    var filterdata: [String]!
    var userName :String!
    var viewModelUser = UserViewModel()
    var count :Int = 0
    var userData :User!
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModelUser.delegate = self
        
    }
    @IBAction func searchButtonAction(_ sender: Any) {
        viewModelUser.getTrendingMovies(text: textBar.text!)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if userName == nil{
            cell.textLabel?.text = carData[0]
        }
        else {
            cell.textLabel?.text = userName
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = UserDetailsViewController()
        secondVC.userDetails = userData
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}

extension ViewController: DeveloperEntryDelegate {
    func FetchUser(data: User) {
        userData = data
        if(data.login != nil){
            self.userName = data.name!
        }
        else {
            self.userName = "No Data Found"
        }
        self.count = 1
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    
}


