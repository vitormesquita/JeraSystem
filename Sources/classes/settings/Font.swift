//
//  Font.swift
//  JeraSystem
//
//  Created by Victor Pereira on 07/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

protocol ThemeFont {
    
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

class DefaultFontTheme: ThemeFont {

    lazy var headline1 = UIFont.systemFont(ofSize: 96)
    lazy var headline2 = UIFont.systemFont(ofSize: 60, weight: UIFont.Weight(300))
    lazy var headline3 = UIFont.systemFont(ofSize: 48)
    lazy var headline4 = UIFont.systemFont(ofSize: 34)
    lazy var headline5 = UIFont.systemFont(ofSize: 24)
    lazy var headline6 = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(500))
    
    lazy var body1 = UIFont.systemFont(ofSize: 16)
    lazy var body2 = UIFont.systemFont(ofSize: 14)
    
    lazy var subtitle1 = UIFont.systemFont(ofSize: 16)
    lazy var subtitle2 = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(500))
    
    lazy var button = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(500))
    
    lazy var caption = UIFont.systemFont(ofSize: 12)
}
