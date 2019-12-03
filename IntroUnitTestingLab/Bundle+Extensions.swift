//
//  Bundle+Extensions.swift
//  IntroUnitTestingLab
//
//  Created by casandra grullon on 12/2/19.
//  Copyright © 2019 casandra grullon. All rights reserved.
//

import Foundation

extension Bundle {
    
    static func readRawData(filename: String, ext: String) -> Data {
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: ext) else {
            fatalError("resource with filename not found")
        }
        var data: Data!
        
        do{
            data = try Data.init(contentsOf: fileURL)
        } catch {
            fatalError("\(error)")
        }
        
        return data
    }
}
