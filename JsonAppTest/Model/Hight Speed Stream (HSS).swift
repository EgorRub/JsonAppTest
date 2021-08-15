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
    let instruments: [Instrument]
    let linkedEvents: ActivityID
    let link: String?
    
    var definition: String {
        """
        \(hssID!)
        \(eventTime!)
        """
    }
    
    init(hssData: [String: Any]) {
        hssID = hssData["hssID"] as? String ?? ""
        eventTime = hssData["eventTime"] as? String ?? ""
        let dictInstruments = hssData["instruments"] as? [[String: String]]
        instruments = Instrument.getInstruments(value: dictInstruments ?? [])
        
        let dictLindedEvents = hssData["linkedEvents"] as? [String: String]
        linkedEvents = ActivityID(value: dictLindedEvents ?? [:])
        
        link = hssData["linkedEvents"] as? String ?? ""
    }
        
        static func getHSS(from value: Any) -> [HSS] {
            guard let hssData = value as? [[String: Any]] else { return [] }
            return hssData.compactMap { HSS(hssData: $0) }
        }
    
}

struct Instrument: Decodable {
    let displayName: String?
    init(value: [String: String]) {
        displayName = value["displayName"]
        }
    
    static func getInstruments(value: Any) -> [Instrument] {
        guard let instrumentsData = value as? [[String: String]] else { return [] }
        return instrumentsData.compactMap { Instrument(value: $0) }
    }
}

struct ActivityID: Decodable {
    let activityID: String?
    init(value: [String: String]){
        activityID = value["activityID"]
    }
}

