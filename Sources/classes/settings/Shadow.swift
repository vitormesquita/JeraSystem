//
//  Shadow.swift
//  JeraSystem
//
//  Created by Vitor Mesquita on 04/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

/**
 
 */
enum Shadow {
    
    case none
    case shadow1
    case shadow2
    case shadow4
    case shadow6
    case shadow8
    case shadow12
    case shadow16
    case shadow24
    
    var offeset: CGSize {
        switch self {
        case .none:
            return CGSize(width: 0, height: 0)
        case .shadow1:
            return CGSize(width: 0, height: 0.5)
        case .shadow2:
            return CGSize(width: 0, height: 1)
        case .shadow4:
            return CGSize(width: 0, height: 2)
        case .shadow6:
            return CGSize(width: 0, height: 3)
        case .shadow8:
            return CGSize(width: 0, height: 4)
        case .shadow12:
            return CGSize(width: 0, height: 6)
        case .shadow16:
            return CGSize(width: 0, height: 8)
        case .shadow24:
            return CGSize(width: 0, height: 12)
        }
    }
    
    var opacity: Float {
        switch self {
        case .none:
            return 0
        default:
            return 0.5
        }
    }
}
