//
//  Card2.swift
//  JeraSystem
//
//  Created by Victor Pereira on 12/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

@IBDesignable
class Card2: SimpleCard {
    
    internal var avatarImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = ThemeManager.shared.color.gray4
        return imageView
    }()
    
    override func prepare() {
        addSubview(avatarImageView)
        
        super.prepare()
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.deactivate(configurableConstraints)
        
        configurableConstraints = [
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            
            avatarImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            avatarImageView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 26),
            avatarImageView.widthAnchor.constraint(equalToConstant: 26),
            avatarImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
            
            
            bodyLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            bodyLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 16),
            bodyLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
        ]
        
        NSLayoutConstraint.activate(configurableConstraints)
    }
}
