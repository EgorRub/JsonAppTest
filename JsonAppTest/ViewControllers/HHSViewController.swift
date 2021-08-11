//
//  HHSViewController.swift
//  JsonAppTest
//
//  Created by Егор on 11.08.2021.
//

import Alamofire

class HHSViewController: UITableViewController {

    private var hss: [HSS] = []
    
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
        AF.request(URLExamples.alamofire.rawValue, method: .get)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    self.hss = HSS.getHSS (from: value)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}
