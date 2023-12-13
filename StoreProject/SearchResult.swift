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
    var trackViewUrl: String? = ""
    var collectionName: String? = ""
    var collectionViewUrl: String? = ""
    var collectionPrice: Double? = 0.0
    var itemPrice: Double? = 0.0
    var itemGenre: String? = ""
    var bookGenre: [String]? = []

    enum CodingKeys: String, CodingKey {
        case imageSmall = "artworkUrl60"
        case imageLarge = "artworkUrl100"
        case itemGenre = "primaryGenreName"
        case bookGenre = "genres"
        case itemPrice = "price"
        case kind, artistName, currency
        case trackName, trackPrice, trackViewUrl
        case collectionName, collectionViewUrl, collectionPrice
    }
    
    var name: String {
        trackName ?? collectionName ?? ""
    }
    
    var storeURL: String {
        trackViewUrl ?? collectionViewUrl ?? ""
    }
    
    var price: Double {
        trackPrice ?? collectionPrice ?? itemPrice ?? 0.0
    }
    
    var genre: String {
        if let genre = itemGenre {
            return genre
        } else if let genres = bookGenre {
            return genres.joined(separator: ", ")
        }
        return ""
    }
    
    var type: String {
        kind ?? "audiobook"
    }
    
    var artist: String {
        artistName ?? ""
    }
    
    var description: String {
        "\nResult - Kind: \(kind ?? "None"), Name: \(name), Artist Name: \(artistName ?? "None")"
    }
}
