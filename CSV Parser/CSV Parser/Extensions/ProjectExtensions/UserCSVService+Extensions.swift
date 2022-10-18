//
//  UserCSVService+Extensions.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 18/10/22.
//

import Foundation


extension UserCSVService: CSVParserProtocol {
    func getHeaders(row: String) -> [String] {
        
        return []
    }
    
    func convert(row: String) -> [String] {
        
        
        return []
    }
    
    func parse<User>(for file: String, completion: @escaping ([User]) -> ()) throws {
        
        
        completion([])
    }
    
    
}
