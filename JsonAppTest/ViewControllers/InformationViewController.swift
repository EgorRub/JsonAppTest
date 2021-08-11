//
//  InformationViewController.swift
//  JsonAppTest
//
//  Created by Егор on 11.08.2021.
//

import UIKit

class InformationViewController: UIViewController {

    var person: Person!
    
    @IBOutlet var fullInformationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = String("Author ID: \(person.id!)")
        fullInformationLabel.text = person.fullInformation
        
    }
    

}
