//
//  FileImporter.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 4/10/22.
//

import Foundation


protocol FileImportProtocol {
    func getFileUrl(from name: String) -> URL?
    func fileExists(for path: String) throws -> Bool
}

protocol GetFilesProtocol {
    func getFiles() throws -> [String]
}

struct FileImporter {
    
    // MARK: - Variables
    // Internal
    internal let fileExtension: String
    
}
