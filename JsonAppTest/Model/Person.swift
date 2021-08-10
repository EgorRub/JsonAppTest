//
//  Person.swift
//  JsonAppTest
//
//  Created by Егор on 10.08.2021.
//

import Foundation


struct Person: Decodable {
    
    let id: Int?
    let author: String?
    let email: String?
    let title: String?
    
}
