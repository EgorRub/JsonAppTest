//
//  PersonCell.swift
//  JsonAppTest
//
//  Created by Егор on 10.08.2021.
//

import UIKit

class PersonCell: UITableViewCell {
    
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    
    func configur(with person: Person){
        
        idLabel.text = String(person.id ?? 0)
        authorLabel.text = person.author
        emailLabel.text = person.email
        titleLabel.text = person.title
        
    }
    
}
