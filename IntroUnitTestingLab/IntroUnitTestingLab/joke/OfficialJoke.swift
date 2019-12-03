//
//  OfficialJoke.swift
//  IntroUnitTestingLab
//
//  Created by casandra grullon on 12/2/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import Foundation

struct OfficialJoke: Codable {
}

struct Joke: Codable {
    let type: String
    let setup: String
    let punchline: String
}
