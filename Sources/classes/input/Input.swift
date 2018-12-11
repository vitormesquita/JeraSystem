//
//  Input.swift
//  JeraSystem
//
//  Created by Victor Pereira on 11/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

enum InputStatus {
    case `default`
    case error
    case success
    case none
    
    var color: UIColor {
        switch self {
        case .default,
             .none:
            return .gray
            
        case .error:
            return ThemeManager.shared.color.error
            
        case .success:
            return ThemeManager.shared.color.primary
        }
    }
}

class Input: UITextField {
    
    internal var status: InputStatus = .none
    
    private lazy var message: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    internal func prepare() {
    
    }
}
