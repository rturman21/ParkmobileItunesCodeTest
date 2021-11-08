//
//  ArtistResultModel.swift
//  itunesCodeTest
//
//  Created by Robert Turman on 11/1/21.
//

import Foundation

struct Results: Codable {
    var resultCount: Int
    var results: [ArtistResult]
}

struct ArtistResult: Codable {
    var artistName: String?
    var collectionName: String?
    var trackName: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var releaseDate: String?
    var trackPrice: Double?
    var trackNumber: Int?
    var primaryGenreName: String?
}
