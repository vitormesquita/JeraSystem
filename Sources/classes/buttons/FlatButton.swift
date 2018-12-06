//
//  FlatButton.swift
//  JeraSystem
//
//  Created by Victor Pereira on 05/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

@IBDesignable
class FlatButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup() {
        tintColor = ThemeManager.shared.color.primary
    }
}
