//
//  Network Manager.swift
//  JsonAppTest
//
//  Created by Егор on 12.08.2021.
//

import Foundation


class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchData(_ complition: @escaping(Person) -> Void) {
        let jsonURL = "https://training.xcelvations.com/data/books.json"
        guard let url = URL(string: jsonURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error { print(error); return }
            guard let data = data else { return }
            
            do {
                let persons = try JSONDecoder().decode([Person].self, from: data)
            } catch let error {
                print(error)
            }
        }.resume()
}
}
