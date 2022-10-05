//
//  String+Extensions.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 5/10/22.
//

import Foundation


extension String {
    func getLastPath() -> String {
        if self.isEmpty {
            return ""
        }
        let path = URL(fileURLWithPath: self)
        return path.lastPathComponent
    }
}
