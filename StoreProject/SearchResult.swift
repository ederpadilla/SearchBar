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

class SearchResult: Codable, CustomStringConvertible {
    var artistName: String? = ""
    var trackName: String? = ""
    var kind: String? = ""
    var trackPrice: Double? = 0.0
    var currency: String? = ""
    var artworkUrl60: String? = ""
    var artworkUrl100: String? = ""
    var trackViewUrl: String? = ""
    var primaryGenreName: String? = ""
    
    var name: String {
        return trackName ?? ""
    }
    
    var description: String {
        "\nResult - Kind: \(kind ?? "None"), Name: \(name), Artist Name: \(artistName ?? "None")"
    }
}
