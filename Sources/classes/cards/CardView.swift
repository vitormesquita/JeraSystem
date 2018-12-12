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
    
    internal var configurableConstraints = [NSLayoutConstraint]()
    
    @IBInspectable
    var cornerRadius: CGFloat = 4 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    var shadow: Shadow = .shadow12 {
        didSet {
            configureShadow()
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
        backgroundColor = ThemeManager.shared.color.background
        layer.cornerRadius = cornerRadius
        
        configureShadow()
        configureConstraints()
    }
    
    internal func configureConstraints() {}
}

extension CardView {
    
    /**
     */
    private func configureShadow() {
        layer.shadowOpacity = shadow.opacity
        layer.shadowOffset = shadow.offeset
    }
}
