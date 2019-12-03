//
//  StarWars.swift
//  IntroUnitTestingLab
//
//  Created by casandra grullon on 12/2/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import Foundation

struct StarWars: Codable {
    var results: [StarWarsInfo]
}

struct StarWarsInfo: Codable {
    let title: String
    let episode: Int
    let openingCrawl: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case episode = "episode_id"
        case openingCrawl = "opening_crawl"
    }
}

extension StarWars {
    static func getMovieInfo() -> [StarWarsInfo] {
        var swInfo = [StarWarsInfo]()
        
        guard let fileURL = Bundle.main.url(forResource: "starWars", withExtension: "json") else {
            fatalError("issue with url")
        }
        
        do{
           let data = try Data(contentsOf: fileURL)
            let starMovieData = try JSONDecoder().decode(StarWars.self, from: data)
            swInfo = starMovieData.results
        } catch {
            fatalError("\(error)")
        }
        return swInfo
    }
}
