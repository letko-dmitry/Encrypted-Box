//
//  Cache.swift
//
//
//  Created by Dzmitry Letko on 24/09/2023.
//

import Foundation

struct Cache: Codable {
    let resources: [Resource]
}

extension Cache {
    static func read(from fileUrl: URL) -> (cache: Cache?, corrupted: Bool) {
        do {
            let data = try Data(contentsOf: fileUrl, options: .uncached)
            let cache = try JSONDecoder().decode(Cache.self, from: data)
            
            return (cache: cache, corrupted: false)
        } catch CocoaError.fileReadNoSuchFile {
            return (cache: nil, corrupted: false)
        } catch {
            NSLog("Cache read from \(fileUrl), error: \(error)")
            
            return (cache: nil, corrupted: true)
        }
    }
    
    func write(to fileUrl: URL) {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            
            let data = try encoder.encode(self)
            try data.write(to: fileUrl)
        } catch {
            NSLog("Cache write to \(fileUrl), error: \(error)")
        }
    }
}
