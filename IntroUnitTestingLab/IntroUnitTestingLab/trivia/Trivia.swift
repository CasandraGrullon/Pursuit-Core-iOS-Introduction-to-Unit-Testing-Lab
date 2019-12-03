//
//  Trivia.swift
//  IntroUnitTestingLab
//
//  Created by casandra grullon on 12/2/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import Foundation

struct Trivia: Codable {
    let results: [TriviaInfo]
}

struct TriviaInfo: Codable {
    let category: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    enum CodingKeys: String, CodingKey {
        case category
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
    
}

extension Trivia {
    static func getTrivia() -> [TriviaInfo] {
        var trivia = [TriviaInfo]()
        
        guard let fileURL = Bundle.main.url(forResource: "trivia", withExtension: "json") else {
            fatalError("issue with url")
        }
        
        do{
            let data = try Data(contentsOf: fileURL)
            let triviaData = try JSONDecoder().decode(Trivia.self, from: data)
            trivia = triviaData.results
        } catch {
            fatalError("\(error)")
        }
        return trivia
    }
}


