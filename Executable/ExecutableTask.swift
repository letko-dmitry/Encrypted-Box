//
//  ExecutableTask.swift
//
//
//  Created by Dzmitry Letko on 25/09/2023.
//

import Foundation

struct ExecutableTask: Decodable {
    struct Resource: Decodable {
        let input: String
        let output: String
    }
    
    let root: String
    let code: String
    let box: String
    let resources: [Resource]
}
