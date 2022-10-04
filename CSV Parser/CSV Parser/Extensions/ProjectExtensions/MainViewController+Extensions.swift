//
//  MainViewController+Extensions.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 4/10/22.
//

import Foundation


extension MainViewController {
    
    func registerCell(with identifier: String) {
        tableView.register(UserCell.self, forCellReuseIdentifier: identifier)
    }
    
}
