//
//  RaisedButton.swift
//  JeraSystem
//
//  Created by Vitor Mesquita on 11/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

@IBDesignable
public class RaisedButton: Button {
    
    open var shadow: Shadow = .shadow4 {
        didSet {
            configureShadow()
        }
    }
  
    override public func prepare() {
        super.prepare()
        configureShadow()
        
        tintColor = .white
        backgroundColor = ThemeManager.shared.color.primary
    }
}

extension RaisedButton {
    
    private func configureShadow() {
        layer.shadowOffset = shadow.offeset
        layer.shadowOpacity = shadow.opacity
    }
}
