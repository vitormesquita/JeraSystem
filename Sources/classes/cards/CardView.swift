//
//  CardView.swift
//  JeraSystem
//
//  Created by Vitor Mesquita on 04/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {
    
    private let containerView = UIView()
    private var containerConstraints = [NSLayoutConstraint]()
    
    @IBInspectable
    var margin: CGFloat = 16 {
        didSet {
            configureContainerConstraints()
        }
    }
    
    var shadow: Shadow = .shadow12 {
        didSet {
            configureContainerShadow()
        }
    }
 
    override init(frame: CGRect) {
        super.init(frame: .zero)
        prepare()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    internal func prepare() {
        self.addSubview(containerView)
        
        containerView.layer.cornerRadius = 4
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = ThemeManager.shared.color.background
        
        configureContainerShadow()
        configureContainerConstraints()
    }
}

extension CardView {
    
    /**
     */
    private func configureContainerConstraints() {
        NSLayoutConstraint.deactivate(containerConstraints)
        
        containerConstraints = [
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: margin),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -margin),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin)
        ]
        
        NSLayoutConstraint.activate(containerConstraints)
    }
    
    /**
     */
    private func configureContainerShadow() {
        containerView.layer.shadowOpacity = shadow.opacity
        containerView.layer.shadowOffset = shadow.offeset
    }
}
