//
//  CSVError+Extensions.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 19/10/22.
//

import Foundation


extension CSVError {
    
    var errorDescription: String {
        
        switch self {
        case .FileNotFound:
            return "Unable to find csv file"
        case .StringInitError:
            return "Unable to encode csv file"
        case .NonCompleteFile:
            return "CSV file has no data or header"
        case .EmptyRow:
            return "Some rows couldn't be parsed, because they are empty"
        case .MismatchRowCount:
            return "Some rows contain multilined values or have mismatch components"
        case .DefaultError:
            return "An unexpected error occurred. Please try again"
        }
        
    }
    
}
