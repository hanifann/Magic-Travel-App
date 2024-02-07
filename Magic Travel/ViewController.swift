//
//  ViewController.swift
//  Magic Travel
//
//  Created by hanifan nurul haq on 07/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var countriesTableView: UITableView!
    
    var countries: [String] = ["Germany", "USA", "China", "Australia", "Indonesia", "Canada", "Filipino", "Brazil", "Mexico"]
    var continents: [String: String] = ["Germany": "Europe", "USA":"North America", "China":"Asia", "Australia":"Oceania", "Indonesia":"SEA", "Canada":"North America", "Filipino":"SEA", "Brazil":"South America", "Mexico": "North America"]
    
    struct Constant {
        static let cellIdentifier = "magicCountryCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        countriesTableView.register(UITableViewCell.self,
                                    forCellReuseIdentifier: Constant.cellIdentifier)
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, 
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier,
                                                          for: indexPath)
        
        var cellConfiguration = tableViewCell.defaultContentConfiguration()
        let countryName = countries[indexPath.row]
        cellConfiguration.text = countryName
        cellConfiguration.secondaryText = continents[countryName]
        tableViewCell.contentConfiguration = cellConfiguration
        
        return tableViewCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User tapped cell at \(indexPath)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

