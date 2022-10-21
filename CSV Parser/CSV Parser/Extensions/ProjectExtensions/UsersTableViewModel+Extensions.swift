//
//  UsersTableViewModel+Extensions.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 19/10/22.
//

import Foundation

// MARK: - CSVParserProtocol functions
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
    
    internal func isBackslash(field: String) -> Bool {
        (field as NSString).substring(to: 1) == "\""
    }
    
    func convert(row: String) throws -> [String] {
        var userData = [String]()
        // Skip empty row
        if row.isEmpty {
            throw(CSVError.EmptyRow)
        }
        // Replace carriage return to prevent malformed last component
        var rowToScan = row.replacingOccurrences(of: carriageReturn, with: "")
        // Check if row contains quoted fields
        if rowToScan.localizedStandardRange(of: "\"") != nil {
            // Initialize temp field and string Scanner element
            var rowElement: String?
            var scanner = Scanner(string: rowToScan)
            
            // Iterate until scanner is empty
            while !scanner.isAtEnd {
                // Check if field begins with backslash
                if isBackslash(field: scanner.string) {
                    print(scanner.currentIndex)
                    // Skip index of backslash
                    scanner.currentIndex = scanner.string.index(after: scanner.currentIndex)
                    // Scan string differently based on position in the row
                    // If not last field, parse field until separator
                    if scanner.string.contains("\",") {
                        rowElement = scanner.scanUpToString("\",")
                    } else {
                        rowElement = scanner.scanUpToString("\"")
                    }
                    // Skip index of backslash
                    scanner.currentIndex = scanner.string.index(after: scanner.currentIndex)
                    print(scanner.currentIndex)
                } else {
                    // Scan until separator
                    rowElement = scanner.scanUpToString(separator)
                }
                // Add element to user data
                userData.append(rowElement ?? "")
                // Move to next row element
                if !scanner.isAtEnd {
                    let nextIndex = scanner.string.index(after: scanner.currentIndex)
                    rowToScan = String(scanner.string[nextIndex...])
                } else {
                    rowToScan.removeAll()
                }
                scanner = Scanner(string: rowToScan)
            }
        } else {
            userData = rowToScan.components(separatedBy: separator)
        }
        return userData
    }
    
    func parse(for file: String, completion: @escaping (Result<[User], CSVError>) -> ()) {
        let filename = (file as NSString).deletingPathExtension
        parsingThread.async { [weak self] in
            do {
                if let fileExists = try self?.fileImporter.fileExists(for: filename) {
                    if fileExists {
                        // We assume that the header is the 1st component of the file.
                        // Otherwise, CSVError.NonCompleteFile is thrown
                        if let fileData = try self?.openCSV(file: filename),
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


// MARK: - UserConverter functions
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
