//
//  OfficialJoke.swift
//  IntroUnitTestingLab
//
//  Created by casandra grullon on 12/2/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import Foundation

struct OfficialJoke: Codable {
    let setup: String
    let punchline: String
}

extension OfficialJoke {
    
    static func getJokes() -> [OfficialJoke] {
        var joke = [OfficialJoke]()
        
        guard let fileURL = Bundle.main.url(forResource: "officialJoke", withExtension: "json") else {
            fatalError("issue with url")
        }
        
        do{
            let data = try Data(contentsOf: fileURL)
            let jokeData = try JSONDecoder().decode([OfficialJoke].self, from: data)
            joke = jokeData
        } catch {
            fatalError("\(error)")
        }
        
        return joke
    }
}
