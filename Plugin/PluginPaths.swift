//
//  PluginPaths.swift
//
//
//  Created by Dzmitry Letko on 24/09/2023.
//

import Foundation
import PackagePlugin

struct PluginPaths {
    struct Directories {
        let root: Path
        let output: Path
        let box: Path
        
        init(root: Path) {
            self.root = root
            self.output = root.appending(subpath: "Output")
            self.box = output.appending(subpath: "Box")
        }
    }
    
    struct Files {
        let code: Path
        let task: Path
    }
    
    let directories: Directories
    let files: Files
    
    init(root: Path) {
        directories = .init(root: root)
        files = .init(
            code: directories.output.appending(subpath: "Box.swift"),
            task: directories.root.appending(subpath: "task.json")
        )
    }
    
    func output(name: String) -> Path {
        return directories.box.appending(subpath: "\(name).dat")
    }
}
