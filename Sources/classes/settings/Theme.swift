//
//  Theme.swift
//  JeraSystem
//
//  Created by Vitor Mesquita on 04/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

protocol ThemeColor {
    
    var primary: UIColor { get }
    var primaryDark: UIColor { get }
    var primaryLight: UIColor { get }
    
    var secondary: UIColor { get }
    var secondaryDark: UIColor { get }
    var secondaryLight: UIColor { get }
    
    var error: UIColor { get }
    var errorLight: UIColor { get }
    
    var background: UIColor { get }
    var surface: UIColor { get }
    
    var gray1: UIColor { get }
    var gray2: UIColor { get }
    var gray3: UIColor { get }
    var gray4: UIColor { get }
}

class ThemeManager {
    
    static let shared = ThemeManager()
    
    private(set) var color: ThemeColor = DefaultTheme()
}

class DefaultTheme: ThemeColor {
    
    var primary: UIColor = UIColor(red:0.4, green:0.23, blue:0.72, alpha:1)
    var primaryDark: UIColor = UIColor(red:0.2, green:0.04, blue:0.53, alpha:1)
    var primaryLight: UIColor = UIColor(red:0.77, green:0.79, blue:0.91, alpha:1)
    
    var secondary: UIColor = UIColor(red: 0, green: 0.74, blue: 0.83, alpha: 1)
    var secondaryDark: UIColor = UIColor(red: 0, green: 0.55, blue: 0.64, alpha: 1)
    var secondaryLight: UIColor = UIColor(red: 0.38, green: 0.94, blue: 1, alpha: 1)
    
    var error: UIColor = UIColor(red: 0.96, green: 0.26, blue: 0.21, alpha: 1)
    var errorLight: UIColor = UIColor(red: 0.94, green: 0.6, blue: 0.6, alpha: 1)
    
    var background: UIColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
    var surface: UIColor = .white
    
    var gray1: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)
    var gray2: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
    var gray3: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.38)
    var gray4: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12)
}
