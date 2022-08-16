//
//  Music.swift
//  rss_generator_tw_music
//
//  Created by rjjq on 2022/8/16.
//

import Foundation

struct SearchResponse: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [Item]
}

struct Item: Decodable {
    let artistName: String?
    let name: String
    let releaseDate: String?
    let artworkUrl100: URL?
    let url: URL?
}
