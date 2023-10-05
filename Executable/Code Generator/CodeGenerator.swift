//
//  CodeGenerator.swift
//  
//
//  Created by Dzmitry Letko on 25/09/2023.
//

import Foundation
import Algorithms

struct CodeGenerator {
    let fileUrl: URL
    
    func generate(for resources: [Resource]) throws {
        let declarations = resources.map { resource in
            """
                static let \(resource.input.variableName) = SecureBoxResources.File(
                    path: .init(
                        name: \"\(resource.output.name)\"
                    ),
                    key: \"\(resource.output.key.base64)\"
                )
            """
        }
        
        let code = """
            import Foundation
            import SecureBoxResources
            
            enum SecureBox {
            \(declarations.joined(separator: "\n\n"))
            }
            """
        
        try code.write(to: fileUrl, atomically: false, encoding: .utf8)
    }
}

// MARK: - Resource.Input
private extension Resource.Input {
    var variableName: String {
        let fileNameComponents = url
            .deletingPathExtension()
            .lastPathComponent
            .components(separatedBy: ".")
        
        var variableNameComponents: [String?] = []
        variableNameComponents.append(fileNameComponents.first?.lowercased())
        variableNameComponents.append(contentsOf: fileNameComponents.dropFirst().map { $0.capitalized })
        variableNameComponents.append(url.pathExtension.capitalized)
        
        return variableNameComponents.compacted().joined()
    }
}

// MARK: - Resource.Output
private extension Resource.Output {
    var name: String {
        url.deletingPathExtension().lastPathComponent
    }
}
