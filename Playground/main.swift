//
//  main.swift
//  
//
//  Created by Dzmitry Letko on 05/10/2023.
//

import Foundation

print(try JSONSerialization.jsonObject(with: SecureBox.exampleJson.open(), options: []))
