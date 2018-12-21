//
//  SimpleCard.swift
//  JeraSystem
//
//  Created by Victor Pereira on 12/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

/**
 A card with title and body.
*/
@IBDesignable
class SimpleCard: CardView {
    
    // MARK: - Outlet
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    
    // MARK: - Inspectable
    /// The maximum number of lines to use for rendering text.
    @IBInspectable
    open var titleNumberOfLines: Int = 1 {
        didSet {
            titleLabel.numberOfLines = titleNumberOfLines
        }
    }
    
    /// The color of the text.
    @IBInspectable
    var titleColor: UIColor = ThemeManager.shared.color.surface {
        didSet {
            titleLabel.textColor = titleColor
        }
    }
    
    /// The font used to display the text.
    @IBInspectable
    open var titleFont: UIFont = ThemeManager.shared.font.subtitle1 {
        didSet {
            titleLabel.font = titleFont
        }
    }
    
    /// The current text that is displayed by the label
    @IBInspectable
    open var titleText: String = "Simple Card Title" {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    /// The maximum number of lines to use for rendering text.
    @IBInspectable
    open var bodyNumberOfLines: Int = 1 {
        didSet {
            bodyLabel.numberOfLines = bodyNumberOfLines
        }
    }
    
    /// The color of the text.
    @IBInspectable
    open var bodyColor: UIColor = ThemeManager.shared.color.surface {
        didSet {
            bodyLabel.textColor = bodyColor
        }
    }
    
    /// The font used to display the text.
    @IBInspectable
    open var bodyFont: UIFont = ThemeManager.shared.font.caption {
        didSet {
            bodyLabel.font = bodyFont
        }
    }
    
    /// The current text that is displayed by the label
    @IBInspectable
    open var bodyText: String = "Simple Card Body" {
        didSet {
            bodyLabel.text = bodyText
        }
    }
    
    // MARK: - Override
    override var nibName: String? {
        get {
            return "SimpleCard"
        }
    }
    
    
    override internal func prepare() {
        super.prepare()
        
        titleLabel.numberOfLines = titleNumberOfLines
        titleLabel.textColor = titleColor
        titleLabel.font = titleFont
        titleLabel.text = titleText
        
        bodyLabel.numberOfLines = bodyNumberOfLines
        bodyLabel.textColor = bodyColor
        bodyLabel.font = bodyFont
        bodyLabel.text = bodyText
        
        backgroundColor = ThemeManager.shared.color.primary
    }
}
