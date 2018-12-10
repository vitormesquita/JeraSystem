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
    private(set) var font: FontTheme = DefaultFontTheme()
}

class DefaultTheme: ThemeColor {
    
    var primary: UIColor = .white
    var primaryDark: UIColor = .white
    var primaryLight: UIColor = .white
    
    var secondary: UIColor = .white
    var secondaryDark: UIColor = .white
    var secondaryLight: UIColor = .white
    
    var error: UIColor = .white
    var errorLight: UIColor = .white
    
    var background: UIColor = .white
    var surface: UIColor = .white
    
    var gray1: UIColor = .white
    var gray2: UIColor = .white
    var gray3: UIColor = .white    
    var gray4: UIColor = .white
}
