//
//  MainViewController.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas  on 30/9/22.
//

import UIKit

class MainViewController: UITableViewController {
    
    // MARK: - Variables
    // Public
    // Private
    private let cellID = "UserCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createNavigation(with: "Clients Information")
        setupDefaultTableViewProperties()
        registerCell(with: cellID)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? UserCell else {
            return UITableViewCell()
        }
        return cell
    }
}
