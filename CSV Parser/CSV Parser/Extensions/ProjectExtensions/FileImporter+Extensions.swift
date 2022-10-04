//
//  FileImporter+Extensions.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 4/10/22.
//

import Foundation

extension FileImporter {
    
    enum FileError: Error {
        case FileNotFound
        case NoFilesFound
    }
    
    func getDescription(for error: FileError) -> String {
        switch error {
        case .FileNotFound:
            return "Unable to find csv file"
        case .NoFilesFound:
            return "No csv files found in the project"
        }
    }
    
}
