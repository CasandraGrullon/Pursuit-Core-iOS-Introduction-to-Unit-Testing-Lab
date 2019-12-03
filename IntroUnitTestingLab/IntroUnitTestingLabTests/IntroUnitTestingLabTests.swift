//
//  IntroUnitTestingLabTests.swift
//  IntroUnitTestingLabTests
//
//  Created by casandra grullon on 12/2/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import XCTest
@testable import IntroUnitTestingLab

class IntroUnitTestingLabTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testJokeData(){
        let filename = "officialJoke"
        let ext = "json"
        
        let data = Bundle.readRawData(filename: filename, ext: ext)
        
        XCTAssertNotNil(data)
    }
    
    func testStarWarsData(){
        let filename = "starWars"
        let ext = "json"
        
        let data = Bundle.readRawData(filename: filename, ext: ext)
        
        XCTAssertNotNil(data)
    }
    
    

}
