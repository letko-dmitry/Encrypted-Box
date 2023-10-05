//
//  ResourceReader.swift
//  
//
//  Created by Dzmitry Letko on 25/09/2023.
//

import Foundation
import UniformTypeIdentifiers

enum ResourceReader {
    static func read(input: Resource.Input) throws -> Data {
        let data = try Data(contentsOf: input.url, options: .uncached)
        
        switch input.type {
        case UTType.json:
            return try JSONSerialization.data(withJSONObject: JSONSerialization.jsonObject(with: data))
            
        default:
            return data
        }
    }
}
