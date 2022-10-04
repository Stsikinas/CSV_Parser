//
//  UIViewController+Extensions.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas  on 30/9/22.
//

import UIKit


extension UIViewController {
    
    func createNavigation(with title: String? = "Title") {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = title
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "AccentColor") ?? .white]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "AccentColor") ?? .white]
        navigationItem.largeTitleDisplayMode = .always
        
    }
    
}
