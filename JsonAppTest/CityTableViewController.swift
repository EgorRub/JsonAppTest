//
//  CityTableViewController.swift
//  JsonAppTest
//
//  Created by Егор on 08.08.2021.
//

import UIKit

class CityTableViewController: UITableViewController {
    
    private var coordinates: [Coordinates] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 110
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coordinates.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CoordinatesCell
        let city = coordinates[indexPath.row]
        cell.configur(with: city)
        return cell
    }
}

extension CityTableViewController {
    func fetchCity () {
        guard let url = URL(string: URLExamples.selectionOne.rawValue) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error descriprion")
                return
            }
            
            
            do {
                self.coordinates = try JSONDecoder().decode([Coordinates].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        } .resume()
}
}
