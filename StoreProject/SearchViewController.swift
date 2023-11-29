//
//  ViewController.swift
//  StoreProject
//
//  Created by Eder  Padilla on 24/11/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var searchResults = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 51, left: 0, bottom: 0, right: 0)
        // Do any additional setup after loading the view.
    }
    
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchResults = []
        for i in 0...2 {
            searchResults.append(
                String(
                    format: "Fake Result %d for '%@'", i, searchBar.text!
                )
            )
        }
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        searchResults.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SearchResultCell"
        
        var cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        cell?.textLabel!.text = searchResults[indexPath.row]
        return cell ?? UITableViewCell()
    }
}


