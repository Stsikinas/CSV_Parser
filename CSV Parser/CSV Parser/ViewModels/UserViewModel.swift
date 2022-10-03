//
//  UserViewModel.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 3/10/22.
//

import Foundation

struct IssueViewModel {
    
    // MARK: - Variables
    var name: String
    var starsCount: Int
    var dateOfBirth: String
    
    // DI
    init(user: User) {
        name = user.firstName + " " + user.lastName
        starsCount = user.stars
        dateOfBirth = user.dob
    }
    
}
