//
//  UserCell+Extensions.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 3/10/22.
//

import Foundation


extension UserCell {
    
    func configure() {
        titleLabel.text = userViewModel.name
        subtitleLabel.text = "DOB: " + userViewModel.dateOfBirth
        badgeLabel.text = "\(userViewModel.starsCount)"
    }
    
}
