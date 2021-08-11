//
//  HHSViewController.swift
//  JsonAppTest
//
//  Created by Егор on 11.08.2021.
//

import UIKit

class HHSViewController: UITableViewController {

    private let hss: [HSS] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
     
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        hss.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HSSCell
        
        let hss = hss[indexPath.row]
        cell.configur(with: hss)
        
        return cell
    }

}

extension HHSViewController {
    func alamofireGetHSS() {
    
        
    }
    
}
