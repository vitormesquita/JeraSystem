//
//  DottedButton.swift
//  JeraSystem
//
//  Created by Victor Pereira on 06/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

@IBDesignable
public class DottedButton: FlatButton {
    
    private var dottedPath: UIBezierPath?
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        dottedPath = UIBezierPath(roundedRect: rect, cornerRadius: getCornerRadiusByType())
        
        borderWidth = 1
        borderColor = ThemeManager.shared.color.primary
        
        borderColor?.setStroke()
        
        let dashPattern: [CGFloat] = [4, 4]
        dottedPath?.setLineDash(dashPattern, count: 2, phase: 0)
        dottedPath?.stroke()
    }
}

extension DottedButton {
    
    @IBInspectable
    open var borderWidth: CGFloat {
        get { return dottedPath?.lineWidth ?? 1 }
        set { dottedPath?.lineWidth = newValue }
    }
    
    @IBInspectable
    open var borderColor: UIColor? {
        get { return layer.borderColor != nil ? UIColor(cgColor: layer.borderColor!) : nil }
        set { layer.borderColor = newValue?.cgColor }
    }
}
