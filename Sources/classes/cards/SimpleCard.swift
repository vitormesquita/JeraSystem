//
//  SimpleCard.swift
//  JeraSystem
//
//  Created by Victor Pereira on 12/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

/**
*/
@IBDesignable
class SimpleCard: CardView {
    
    internal let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = ThemeManager.shared.font.subtitle1
        return label
    }()
    
    internal let bodyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = ThemeManager.shared.font.caption
        return label
    }()
    
    // MARK: - Inspectable
    
    @IBInspectable
    open var titleText: String = "Title" {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    @IBInspectable
    var bodyText: String = "Body" {
        didSet {
            bodyLabel.text = bodyText
        }
    }
    
    @IBInspectable
    open var titleColor: UIColor = ThemeManager.shared.color.primary {
        didSet {
            titleLabel.textColor = titleColor
        }
    }
    
    @IBInspectable
    open var bodyColor: UIColor = ThemeManager.shared.color.primary {
        didSet {
            bodyLabel.textColor = bodyColor
        }
    }
    
    override func prepare() {
        titleLabel.text = titleText
        bodyLabel.text = bodyText
        
        titleLabel.textColor = titleColor
        bodyLabel.textColor = bodyColor
        
        addSubview(titleLabel)
        addSubview(bodyLabel)
        
        super.prepare()
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.deactivate(configurableConstraints)
        
        configurableConstraints = [
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            bodyLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            bodyLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor),
            bodyLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -28)
        ]
        
        NSLayoutConstraint.activate(configurableConstraints)
    }
}
