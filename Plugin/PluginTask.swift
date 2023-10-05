//
//  PluginTask.swift
//  
//
//  Created by Dzmitry Letko on 25/09/2023.
//

import Foundation
import PackagePlugin

struct PluginTask: Encodable {
    struct Resource: Encodable {
        let input: Path
        let output: Path
    }
    
    let root: Path
    let code: Path
    let box: Path
    let resources: [Resource]
}
