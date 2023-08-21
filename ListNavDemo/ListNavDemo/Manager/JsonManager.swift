//
//  JsonManager.swift
//  ListNavDemo
//
//  Created by JOHNNY_MAC_1 on 2023/07/25.
//

import Foundation

final class JsonManager {
    static let getManager: JsonManager = JsonManager()
    
    private init(){
        
    }
    
    func loadJson<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("[\(#file)][\(#line)] \(#function): \(filename) is not found")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("[\(#file)][\(#line)] \(#function): \(file) is unable to be loaded, Error: \(error)")
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            fatalError("[\(#file)][\(#line)] \(#function): \(data) is unable to be parsed, Error: \(error)")
        }
    }
}
