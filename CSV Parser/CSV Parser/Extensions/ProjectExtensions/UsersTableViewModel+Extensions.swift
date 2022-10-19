//
//  UsersTableViewModel+Extensions.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 19/10/22.
//

import Foundation


extension UsersTableViewModel: CSVParserProtocol {
    
    func openCSV(file: String) throws -> String {
        if let fileURL = fileImporter.getFileUrl(from: file) {
            do {
                return try String.init(contentsOf: fileURL, encoding: .utf8)
            } catch {
                throw(CSVError.StringInitError)
            }
        } else {
            throw(CSVError.FileNotFound)
        }
    }
    
    
    func splitComponents(rawData: String) throws -> [String] {
        let rows = rawData.components(separatedBy: lineSeparator).filter({ !$0.isEmpty })
        if rows.count < 2 {
            throw(CSVError.NonCompleteFile)
        }
        return rows
    }
    
    
    func getHeaders(row: String) -> [String] {
        return row.components(separatedBy: separator)
    }
    
    func convert(row: String) throws -> [String] {
        var userData = [String]()
        // Skip empty row
        if row.isEmpty {
            throw(CSVError.EmptyRow)
        }
        
        return userData
    }
    
    func parse(for file: String, completion: @escaping (Result<[User], CSVError>) -> ()) {
        parsingThread.async { [weak self] in
            do {
                if let fileExists = try self?.fileImporter.fileExists(for: file) {
                    if fileExists {
                        // We assume that the header is the 1st component of the file.
                        // Otherwise, CSVError.NonCompleteFile is thrown
                        if let fileData = try self?.openCSV(file: file),
                           let userComponents = try self?.splitComponents(rawData: fileData) {
                                self?.headersCount = self?.getHeaders(row: userComponents[0]).count ?? 0
                                var users = [User]()
                                for i in 1..<userComponents.count {
                                    if let userData = try self?.convert(row: userComponents[i]),
                                       let newUser = self?.convert(rowData: userData) {
                                        users.append(newUser)
                                    }
                                }
                            }
                    } else {
                        completion(.failure(.DefaultError))
                    }
                }
            } catch {
                if let error = error as? CSVError {
                    completion(.failure(error))
                } else {
                    completion(.failure(.DefaultError))
                }
            }
        }
    }
    
    
}

extension UsersTableViewModel: UserConverter {
    
    func convert(rowData: [String]) -> User {
        let rulesAppliedRow = applyRules(for: rowData)
        return User(firstName: rulesAppliedRow[0],
                    lastName: rulesAppliedRow[1],
                    stars: rulesAppliedRow[2].toInt,
                    dob: rulesAppliedRow[3])
    }
    
    func applyRules(for row: [String]) -> [String] {
        
        return row
    }
    
    
}
