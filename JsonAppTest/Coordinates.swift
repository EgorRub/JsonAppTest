//
//  City.swift
//  JsonAppTest
//
//  Created by Егор on 08.08.2021.
//

import Foundation

struct Coordinates: Decodable {
    
    let ip: String?
    let country_code: String?
    let country_name: String?
    let region_code: String?
    let region_name: String?
    let city: String?
    let zip_code: String?
    let time_zone: String?
    let latitude: Int?
    let longitude: Int?
    let metro_code: Int?
}

