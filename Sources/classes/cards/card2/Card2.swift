//
//  Card2.swift
//  JeraSystem`
//
//  Created by Victor Pereira on 12/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

/**
 A card with title, avatar and name.
 */
@IBDesignable
class Card2: CardView {
    
    // MARK: - Outlet
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
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
    open var titleText: String = "Card 2 Title" {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    /// The maximum number of lines to use for rendering text.
    @IBInspectable
    open var nameNumberOfLines: Int = 1 {
        didSet {
            nameLabel.numberOfLines = nameNumberOfLines
        }
    }
    
    /// The color of the text.
    @IBInspectable
    open var nameColor: UIColor = ThemeManager.shared.color.surface {
        didSet {
            nameLabel.textColor = nameColor
        }
    }
    
    /// The font used to display the text.
    @IBInspectable
    open var nameFont: UIFont = ThemeManager.shared.font.caption {
        didSet {
            nameLabel.font = nameFont
        }
    }
    
    /// The current text that is displayed by the label
    @IBInspectable
    open var nameText: String = "Card 2 Body" {
        didSet {
            nameLabel.text = nameText
        }
    }
    
    ///The image displayed in image view.
    @IBInspectable
    open var avatarImage: UIImage = UIImage() {
        didSet {
            avatarImageView.image = avatarImage
        }
    }
    
    /// The view's background color.
    @IBInspectable
    open var avatarBackgroundColor: UIColor = ThemeManager.shared.color.gray4 {
        didSet {
            avatarImageView.backgroundColor = avatarBackgroundColor
        }
    }
    
    // MARK: - Override
    override var nibName: String? {
        get {
            return "Card2"
        }
    }
    
    override internal func prepare() {
        super.prepare()
        
        titleLabel.numberOfLines = titleNumberOfLines
        titleLabel.textColor = titleColor
        titleLabel.font = titleFont
        titleLabel.text = titleText
        
        nameLabel.numberOfLines = nameNumberOfLines
        nameLabel.textColor = nameColor
        nameLabel.font = nameFont
        nameLabel.text = nameText
        
        avatarImageView.backgroundColor = avatarBackgroundColor
        avatarImageView.image = avatarImage
        
        backgroundColor = ThemeManager.shared.color.primary
    }
}
