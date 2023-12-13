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
    var imageSmall: String? = ""
    var imageLarge: String? = ""
    var storeURL: String?? = ""
    var genre: String? = ""

    enum CodingKeys: String, CodingKey {
      case imageSmall = "artworkUrl60"
      case imageLarge = "artworkUrl100"
      case storeURL = "trackViewUrl"
      case genre = "primaryGenreName"
      case kind, artistName, trackName
      case trackPrice, currency
    }
    
    var name: String {
        return trackName ?? ""
    }
    
    var description: String {
        "\nResult - Kind: \(kind ?? "None"), Name: \(name), Artist Name: \(artistName ?? "None")"
    }
}
