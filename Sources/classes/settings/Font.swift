//
//  Font.swift
//  JeraSystem
//
//  Created by Victor Pereira on 07/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

protocol FontTheme {
    var fontName: String { get }
    
    var headline1: UIFont { get }
    var headline2: UIFont { get }
    var headline3: UIFont { get }
    var headline4: UIFont { get }
    var headline5: UIFont { get }
    var headline6: UIFont { get }
    
    var body1: UIFont { get }
    var body2: UIFont { get }
    
    var subtitle1: UIFont { get }
    var subtitle2: UIFont { get }
    
    var button: UIFont { get }
    
    var caption: UIFont { get }
}

class FontManager {
    
    static let shared = FontManager()
    private(set) var font: FontTheme = DefaultFontTheme()
}

class DefaultFontTheme: FontTheme {
    
    var fontName: String
    
    init (fontName: String = "System") {
        self.fontName = fontName
    }

    lazy var headline1 = UIFont(name: self.fontName, size: 96) ?? UIFont.systemFont(ofSize: 96)
    lazy var headline2: UIFont = {
        let font = UIFont(name: self.fontName, size: 60)
        guard let currentFont = font else { return UIFont.systemFont(ofSize: 60, weight: UIFont.Weight(300)) }
        currentFont.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(rawValue: 300))
        return currentFont
    }()
    lazy var headline3 = UIFont(name: self.fontName, size: 48) ?? UIFont.systemFont(ofSize: 48)
    lazy var headline4 = UIFont(name: self.fontName, size: 34) ?? UIFont.systemFont(ofSize: 34)
    lazy var headline5 = UIFont(name: self.fontName, size: 24) ?? UIFont.systemFont(ofSize: 24)
    lazy var headline6: UIFont = {
        let font = UIFont(name: self.fontName, size: 20)
        guard let currentFont = font else { return UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(500)) }
        currentFont.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(rawValue: 500))
        return currentFont
    }()
    
    lazy var body1 = UIFont(name: self.fontName, size: 16) ?? UIFont.systemFont(ofSize: 16)
    lazy var body2 = UIFont(name: self.fontName, size: 14) ?? UIFont.systemFont(ofSize: 14)
    
    lazy var subtitle1 = UIFont(name: self.fontName, size: 16) ?? UIFont.systemFont(ofSize: 16)
    lazy var subtitle2: UIFont = {
        let font = UIFont(name: self.fontName, size: 14)
        guard let currentFont = font else { return UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(500)) }
        currentFont.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(rawValue: 500))
        return currentFont
    }()
    
    lazy var button: UIFont = {
        let font = UIFont(name: self.fontName, size: 14)
        guard let currentFont = font else { return UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(500)) }
        currentFont.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(rawValue: 500))
        return currentFont
    }()
    
    lazy var caption = UIFont(name: self.fontName, size: 12) ?? UIFont.systemFont(ofSize: 12)
}
