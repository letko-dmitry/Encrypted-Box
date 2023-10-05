//
//  ResourceCandidate.swift
//
//
//  Created by Dzmitry Letko on 25/09/2023.
//

import Foundation

struct ResourceCandidate: Hashable {
    let input: Resource.Input
    let outputUrl: URL
    
    init(input: String, output: String) throws {
        self.input = try .init(
            url: .init(filePath: input, directoryHint: .notDirectory)
        )
        self.outputUrl = .init(filePath: output, directoryHint: .notDirectory)
    }
    
    init(resource: Resource) {
        input = resource.input
        outputUrl = resource.output.url
    }
}

extension ResourceCandidate {
    init(resource: ExecutableTask.Resource) throws {
        try self.init(input: resource.input, output: resource.output)
    }
}
