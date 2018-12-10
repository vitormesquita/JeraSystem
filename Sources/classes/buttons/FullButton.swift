//
//  FullButton.swift
//  LearningSwift
//
//  Created by Victor Pereira on 06/12/18.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

@IBDesignable
class FullButton: GhostButton {
    
    override func setup() {
        tintColor = .white
        layer.backgroundColor = ThemeManager.shared.color.primary.cgColor
    }
}
