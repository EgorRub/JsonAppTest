//
//  cityCell.swift
//  JsonAppTest
//
//  Created by Егор on 09.08.2021.
//

import UIKit

class CoordinatesCell: UITableViewCell {
    
    @IBOutlet var ipLabelCell: UILabel!
    @IBOutlet var countryCodeLabel: UILabel!
    @IBOutlet var countryNameLabel: UILabel!
    @IBOutlet var regionCodeLabel: UILabel!
    @IBOutlet var regionNameLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var zipCodeLabel: UILabel!
    @IBOutlet var timeZoneLabel: UILabel!
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var longtitudeLabel: UILabel!
    @IBOutlet var matroCodeLabel: UILabel!
    
    func configur(with city: Coordinates) {
        ipLabelCell.text = city.ip
        countryCodeLabel.text = city.country_code
        regionCodeLabel.text = city.region_code
        regionNameLabel.text = city.region_name
        cityLabel.text = city.city
        zipCodeLabel.text = city.zip_code
        timeZoneLabel.text = city.time_zone
        latitudeLabel.text = "Latitude: \(city.latitude ?? 0)"
        longtitudeLabel.text = "Latitude: \(city.longitude ?? 0)"
        matroCodeLabel.text = "Latitude: \(city.metro_code ?? 0)"
        
    }
}
