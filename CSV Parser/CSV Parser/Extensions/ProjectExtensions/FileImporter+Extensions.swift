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

extension FileImporter: FileImportProtocol {
    
    func getFileUrl(from name: String) -> URL? {
        Bundle.main.url(forResource: name, withExtension: fileExtension)
    }
    
    func fileExists(for path: String) throws -> Bool {
        if let filePath = getFileUrl(from: path) {
            return FileManager.default.fileExists(atPath: filePath.path)
        } else {
            throw(FileError.FileNotFound)
        }
    }
    
}

extension FileImporter: GetFilesProtocol {
    
    func getFiles() throws -> [String] {
        let filePaths = Bundle.main.paths(forResourcesOfType: fileExtension, inDirectory: nil)
        if filePaths.count == 0 {
            throw(FileError.NoFilesFound)
        }
        var files = [String]()
        
        for filePath in filePaths {
            files.append(filePath.getLastPath())
        }
        return files
    }
    
}
