//
//  UsersTableViewModel.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 19/10/22.
//

import Foundation

public struct UsersTableViewModel {
    
    // MARK: - Variables
    // Internal
    internal let parsingThread = DispatchQueue(label: "parseUsers")
    internal var headers = [String]()
    internal let separator = ","
    internal let lineSeparator = "\n"
    internal let fileImporter = FileImporter(fileExtension: "csv")
    
    
}
