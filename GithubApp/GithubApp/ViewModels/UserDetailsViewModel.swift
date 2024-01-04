//
//  UserDetailsViewModel.swift
//  GithubApp
//
//  Created by Kishanjeet, Kishanjeet on 04/01/24.
//

import Foundation

protocol DeveloperEntrySecondDelegate: AnyObject {
    func FetchList( data: [Follwer])
    
}


class UserDetailsViewModel {
    
    weak var delegate: DeveloperEntrySecondDelegate?
    
    func getFollowers(text:String) {
        guard let url = URL(string:text ) else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, Error in
            guard let data = data , Error == nil else {return}
            do{
                let results = try JSONDecoder().decode([Follwer].self, from: data)
                self.delegate?.FetchList(data: results)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()  
    }
    
    
    func getFollowing(text:String) {
        guard let url = URL(string:"https://api.github.com/users/\(text)/following" ) else {return}
        print(url)
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, Error in
            guard let data = data , Error == nil else {return}
            do{
                let results = try JSONDecoder().decode([Follwer].self, from: data)
                print(results)
                self.delegate?.FetchList(data: results)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
    
    
    
    
}
