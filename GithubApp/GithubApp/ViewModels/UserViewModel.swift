//
//  UserViewModel.swift
//  GithubApp
//
//  Created by Kishanjeet, Kishanjeet on 04/01/24.
//

import Foundation

protocol DeveloperEntryDelegate: AnyObject {
    func FetchUser( data: User)
    
}


class UserViewModel {
    
    weak var delegate: DeveloperEntryDelegate?
    
    func getTrendingMovies(text:String) {
        guard let url = URL(string: "https://api.github.com/users/\(text)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, Error in
            guard let data = data , Error == nil else {return}
            do{
                let results = try JSONDecoder().decode(User.self, from: data)
                self.delegate?.FetchUser(data: results)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
    
}

