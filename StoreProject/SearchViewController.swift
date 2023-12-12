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
    
    var searchResults = [SearchResult]()
    var hasSearched = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        var cellNib = UINib(nibName: "SearchResultCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: Constants.searchResultCell.rawValue)
        cellNib = UINib(nibName: Constants.nothingFoundCell.rawValue, bundle: nil)
        tableView.register(
            cellNib,
            forCellReuseIdentifier: Constants.nothingFoundCell.rawValue)
        tableView.contentInset = UIEdgeInsets(top: 51, left: 0, bottom: 0, right: 0)
        searchBar.becomeFirstResponder()
    }
    
    func performStoreRequest(with url: URL) -> String? {
        do {
            return try String(contentsOf: url, encoding: .utf8)
        } catch {
            print("Download Error: \(error.localizedDescription)")
            return nil
        }
    }
    
    func iTunesURL(searchText: String) -> URL {
        let encodedText = searchText.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let urlString = String(format: "https://itunes.apple.com/search?term=%@", encodedText)
        let url = URL(string: urlString)
        return url!
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if !searchBar.text!.isEmpty {
            searchBar.resignFirstResponder()
            
            hasSearched = true
            searchResults = []
            
            let url = iTunesURL(searchText: searchBar.text!)
            print("URL: '\(url)'")
            if let jsonString = performStoreRequest(with: url) {
              print("Received JSON string '\(jsonString)'")
            }
            
            tableView.reloadData()
        }
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        .topAttached
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if !hasSearched {
            return 0
        } else if searchResults.count == 0 {
            return 1
        } else {
            return searchResults.count
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if searchResults.count == 0 {
            return tableView.dequeueReusableCell(withIdentifier: Constants.nothingFoundCell.rawValue,
                                                 for: indexPath)
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.searchResultCell.rawValue,
                                                     for: indexPath) as! SearchResultCellTableViewCell
            
            let searchResult = searchResults[indexPath.row]
            cell.nameLabel.text = searchResult.name
            cell.artistNameLabel.text = searchResult.artistName
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView,
                   willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if searchResults.count == 0 {
            return nil
        } else {
            return indexPath
        }
    }
}

enum Constants: String {
    case searchResultCell = "SearchResultCell"
    case nothingFoundCell = "NothingFoundCell"
}
