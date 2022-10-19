//
//  UsersTableViewModel.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 19/10/22.
//

import Foundation

public class UsersTableViewModel {
    
    // MARK: - Variables
    // Public
    var headersCount = 0
    var reloadTableView: (() -> Void)?
    var issuesViewModel = [UserViewModel]() {
        didSet {
            reloadTableView?()
        }
    }
    // Internal
    internal let parsingThread = DispatchQueue(label: "parseUsers")
    internal let separator = ","
    internal let lineSeparator = "\n"
    internal let fileImporter = FileImporter(fileExtension: "csv")
    
    func getUsers(from file: String) {
        parse(for: file) { result in
            switch result {
            case .success(let users):
                print(users)
                break
            case .failure(let error):
                print(error.errorDescription)
                break
            }

        }
    }
    
}
