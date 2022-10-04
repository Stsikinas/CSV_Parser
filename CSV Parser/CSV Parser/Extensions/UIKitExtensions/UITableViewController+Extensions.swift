//
//  UITableViewController+Extensions.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 4/10/22.
//

import Foundation
import UIKit


extension UITableViewController {
    
    func setupDefaultTableViewProperties() {
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.rowHeight = UITableView.automaticDimension
    }
    
}
