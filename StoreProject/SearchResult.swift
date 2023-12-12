//
//  SearchResult.swift
//  StoreProject
//
//  Created by Eder  Padilla on 28/11/23.
//

import Foundation

class ResultArray: Codable {
    var resultCount = 0
    var results = [SearchResult]()
}

class SearchResult: Codable {
    var artistName: String? = ""
    var trackName: String? = ""
    
    var name: String {
        return trackName ?? ""
    }
}
