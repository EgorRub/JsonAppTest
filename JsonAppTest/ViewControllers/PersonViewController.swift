//
//  PersonViewController.swift
//  JsonAppTest
//
//  Created by Егор on 10.08.2021.
//

import UIKit

class PersonViewController: UITableViewController {
    
    private var persons: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 150
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PersonCell
        
        let person = persons[indexPath.row]
        cell.configur(with: person)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let informationVC = segue.destination as! InformationViewController
            informationVC.person = persons[indexPath.row]
        }
    }
    
}

// MARK: - Networking

extension PersonViewController {
    func fetchPersons() {
        guard let url = URL(string: URLExamples.selectionOne.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
                guard let data = data else { return }
                
                do {
                    self.persons = try JSONDecoder().decode([Person].self, from: data)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch let error {
                    print(error)
                }
            }.resume()
    }
    
}
