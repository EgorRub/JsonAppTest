//
//  HHSCell.swift
//  JsonAppTest
//
//  Created by Егор on 11.08.2021.
//

import UIKit

class HSSCell: UITableViewCell {
    @IBOutlet var hhsLabel: UILabel!
    @IBOutlet var instrumentsLabel: UILabel!
    @IBOutlet var linkedEventsLabel: UILabel!
    
    func configur(with hhs: HSS){
        hhsLabel.text = hhs.definition
        
        instrumentsLabel.text = """
                    \(hhs.instruments.first?.displayName ?? ""),
                    \(hhs.instruments.last?.displayName ?? "")
                    """
        print(hhs.instruments)
        
        linkedEventsLabel.text = hhs.linkedEvents.activityID
        
    }
}
