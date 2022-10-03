//
//  PlaceholderView.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 30/9/22.
//

import UIKit

class PlaceholderView: UIView {
    
    // MARK: - Subview Initializers
    
    lazy var placeholderImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        return imageView
    }()
    
    lazy var placeholderTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 16)
        label.textColor = UIColor(named: "AccentColor")
        label.textAlignment = .center
        label.sizeToFit()
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Initializers
    init(frame: CGRect, title: String = "Placeholder Text", with image: UIImage? = nil) {
        super.init(frame: frame)
        
        placeholderTitle.text = title
        addSubview(placeholderTitle)
        
        if let image = image {
            placeholderImage.image = image
            addSubview(placeholderImage)
            placeholderImage.addAnchors(cXAnchor: centerXAnchor, cYAnchor: centerYAnchor)
            placeholderTitle.addAnchors(wAnchor: widthAnchor, wMulti: 0.8, cXAnchor: centerXAnchor, tAnchor: placeholderImage.bottomAnchor, topConstant: 8)
        } else {
            placeholderTitle.addAnchors(wAnchor: widthAnchor, wMulti: 0.8, cXAnchor: centerXAnchor, cYAnchor: centerYAnchor)
        }
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
