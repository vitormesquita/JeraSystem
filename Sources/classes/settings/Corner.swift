//
//  Corner.swift
//  JeraSystem
//
//  Created by Victor Pereira on 05/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

enum Corner {
    
    case none
    case simple
    case circle
    
    var offset: CGFloat {
        switch self {
        case .none:
            return 0
            
        case .simple:
            return 4
            
        case .circle:
            return 24
        }
    }
}
