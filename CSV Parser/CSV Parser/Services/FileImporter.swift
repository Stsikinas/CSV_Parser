//
//  FileImporter.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 4/10/22.
//

import Foundation


protocol FileImportProtocol {
    func getFileUrl(from name: String, with type: String) -> URL?
    func fileExists(for path: String) throws -> Bool
}

protocol GetFilesProtocol {
    func getFiles() throws -> [String]
}

struct FileImporter: FileImportProtocol, GetFilesProtocol {
    
    // MARK: - Variables
    // Public
    let fileExtension: String
    
    // MARK: - FileImportProtocol functions
    func getFileUrl(from name: String, with type: String) -> URL? {
        Bundle.main.url(forResource: name, withExtension: type)
    }
    
    func fileExists(for path: String) throws -> Bool {
        if let filePath = getFileUrl(from: path, with: fileExtension) {
            return FileManager.default.fileExists(atPath: filePath.path)
        } else {
            throw(FileError.FileNotFound)
        }
    }
    
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
