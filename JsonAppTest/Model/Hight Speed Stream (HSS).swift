//
//  Hight Speed Stream (HSS).swift
//  JsonAppTest
//
//  Created by Егор on 11.08.2021.
//

import Foundation

struct HSS: Decodable {
    let hssID: String?
    let eventTime: String?
    let instruments: [Instruments]
    let linkedEvents: ActivityID
    let link: String?
    
    var definition: String {
        """
        \(hssID)
        \(eventTime)
        """
    }
}

struct Instruments: Decodable {
    let displayName: String?
}

struct ActivityID: Decodable {
    let activityID: String?
}
