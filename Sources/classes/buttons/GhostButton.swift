//
//  GhostButton.swift
//  JeraSystem
//
//  Created by Victor Pereira on 06/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

@IBDesignable
class GhostButton: FlatButton {
    
    @IBInspectable
    var cornerRadius: CGFloat = Corner.simple.offset {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 1 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = ThemeManager.shared.color.primary {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    override func setup() {
        super.setup()
        layer.borderColor = borderColor.cgColor
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
    }
}

