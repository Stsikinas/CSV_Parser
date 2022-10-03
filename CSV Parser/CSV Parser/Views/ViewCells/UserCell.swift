//
//  UserCell.swift
//  CSV Parser
//
//  Created by Stavros Tsikinas on 3/10/22.
//

import UIKit

class UserCell: UITableViewCell {

    // MARK: - Subview Initializers
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 16.0)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 14.0)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .lightGray
        return label
    }()
    
    lazy var badgeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 22.0)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = UIColor(named: "AccentColor")
        return label
    }()
    
    var userViewModel: UserViewModel! {
        
        didSet {
            configure()
        }
        
    }
    
    // MARK: - Cell Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        accessibilityIdentifier = "UserCell"
        
        contentView.addSubview(titleLabel)
        titleLabel.addAnchors(wAnchor: contentView.widthAnchor, wMulti: 0.6, lAnchor: leftAnchor, leftConstant: 12, tAnchor: contentView.topAnchor, topConstant: 8)
        contentView.addSubview(subtitleLabel)
        subtitleLabel.addAnchors(lAnchor: titleLabel.leftAnchor, tAnchor: titleLabel.bottomAnchor, topConstant: 8, bAnchor: contentView.bottomAnchor, bottomConstant: -4)
        contentView.addSubview(badgeLabel)
        badgeLabel.addAnchors(cYAnchor: contentView.centerYAnchor, rAnchor: contentView.rightAnchor, rightConstant: -12)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
