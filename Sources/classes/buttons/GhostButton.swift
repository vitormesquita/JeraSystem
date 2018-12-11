//
//  GhostButton.swift
//  JeraSystem
//
//  Created by Victor Pereira on 06/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

@IBDesignable
public class GhostButton: FlatButton {
    
    override public func prepare() {
        super.prepare()        
        borderWidth = 1
        borderColor = ThemeManager.shared.color.primary
    }
}

extension GhostButton {
    
    @IBInspectable
    open var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable
    open var borderColor: UIColor? {
        get { return layer.borderColor != nil ? UIColor(cgColor: layer.borderColor!) : nil }
        set { layer.borderColor = newValue?.cgColor }
    }
}
