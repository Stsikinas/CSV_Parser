//
//  UIView+Extensions.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 30/9/22.
//

import Foundation
import UIKit

extension UIView {
    func addAnchors(wAnchor: NSLayoutDimension? = nil, wMulti: CGFloat? = nil,
                    hAnchor: NSLayoutDimension? = nil, hMulti: CGFloat? = nil,
                    cXAnchor: NSLayoutXAxisAnchor? = nil,
                    cYAnchor: NSLayoutYAxisAnchor? = nil,
                    lAnchor: NSLayoutXAxisAnchor? = nil, leftConstant: CGFloat? = nil,
                    tAnchor: NSLayoutYAxisAnchor? = nil, topConstant: CGFloat? = nil,
                    rAnchor: NSLayoutXAxisAnchor? = nil, rightConstant: CGFloat? = nil,
                    bAnchor: NSLayoutYAxisAnchor? = nil, bottomConstant: CGFloat? = nil,
                    widthConstant: CGFloat? = nil,
                    heightConstant: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        
        if let wAnchor = wAnchor {
            widthAnchor.constraint(equalTo: wAnchor, multiplier: wMulti == nil ? 1.0 : wMulti!).isActive = true
        }
        
        if let hAnchor = hAnchor {
            heightAnchor.constraint(equalTo: hAnchor, multiplier: hMulti == nil ? 1.0 : hMulti!).isActive = true
        }
        
        if let cXAnchor = cXAnchor {
            centerXAnchor.constraint(equalTo: cXAnchor, constant: 0).isActive = true
        }
        
        if let cYAnchor = cYAnchor {
            centerYAnchor.constraint(equalTo: cYAnchor, constant: 0).isActive = true
        }
        
        if let lAnchor = lAnchor {
            leftAnchor.constraint(equalTo: lAnchor, constant: leftConstant == nil ? 0 : leftConstant!).isActive = true

        }
        
        if let tAnchor = tAnchor {
            topAnchor.constraint(equalTo: tAnchor, constant: topConstant == nil ? 0 : topConstant!).isActive = true

        }
        
        if let rAnchor = rAnchor {
            rightAnchor.constraint(equalTo: rAnchor, constant: rightConstant == nil ? 0 : rightConstant!).isActive = true
        }
        
        if let bAnchor = bAnchor {
            bottomAnchor.constraint(equalTo: bAnchor, constant: bottomConstant == nil ? 0 : bottomConstant!).isActive = true
        }
        
        if let widthConstant = widthConstant {
            widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        }
        
        if let heightConstant = heightConstant {
            heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
        }
    }
}
