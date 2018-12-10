//
//  DottedButton.swift
//  JeraSystem
//
//  Created by Victor Pereira on 06/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//


import UIKit

@IBDesignable
class DottedButton: FlatButton {
    
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
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        path.lineWidth = borderWidth
        
        borderColor.setStroke()
        
        let dashPattern: [CGFloat] = [4, 4]
        path.setLineDash(dashPattern, count: 2, phase: 0)
        path.stroke()
    }
    
}
