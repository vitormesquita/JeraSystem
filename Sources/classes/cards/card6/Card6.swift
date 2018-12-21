//
//  Card6.swift
//  LearningSwift
//
//  Created by Victor Pereira on 13/12/18.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

/**
 A card with image, avatar, title, subtitle and body
 */
@IBDesignable
class Card6: CardView {
    
    //MARK: - Outlet
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var imageConstraintHeight: NSLayoutConstraint!
    
    // MARK: - Inspectable
    /// The image height.
    @IBInspectable
    open var imageHeight: CGFloat = 240 {
        didSet {
            imageConstraintHeight.constant = imageHeight
            updateConstraints()
        }
    }
    
    /// The view's background color.
    @IBInspectable
    open var imageBackgroundColor: UIColor = ThemeManager.shared.color.gray4 {
        didSet {
            imageView.backgroundColor = imageBackgroundColor
        }
    }
    
    ///The image displayed in image view.
    @IBInspectable
    open var image: UIImage = UIImage() {
        didSet {
            imageView.image = image
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
    
    /// The current text that is displayed by the label
    @IBInspectable
    open var titleText: String = "Card 6 Title" {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    /// The font used to display the text.
    @IBInspectable
    open var titleFont: UIFont = ThemeManager.shared.font.headline6 {
        didSet {
            titleLabel.font = titleFont
        }
    }
    
    /// The color of the text.
    @IBInspectable
    open var titleColor: UIColor = ThemeManager.shared.color.gray2 {
        didSet {
            titleLabel.textColor = titleColor
        }
    }
    
    /// The current text that is displayed by the label
    @IBInspectable
    open var subtitleText: String = "Card 6 Subtitle" {
        didSet {
            subtitleLabel.text = subtitleText
        }
    }
    
    /// The font used to display the text.
    @IBInspectable
    open var subtitleFont: UIFont = ThemeManager.shared.font.body2 {
        didSet {
            subtitleLabel.font = subtitleFont
        }
    }
    
    /// The color of the text.
    @IBInspectable
    open var subtitleColor: UIColor = ThemeManager.shared.color.gray2 {
        didSet {
            subtitleLabel.textColor = subtitleColor
        }
    }
    
    /// The current text that is displayed by the label
    @IBInspectable
    open var bodyText: String = "Card 6 Body" {
        didSet {
            bodyLabel.text = bodyText
        }
    }
    
    /// The font used to display the text.
    @IBInspectable
    open var bodyFont: UIFont = ThemeManager.shared.font.body2 {
        didSet {
            bodyLabel.font = bodyFont
        }
    }
    
    /// The color of the text.
    @IBInspectable
    open var bodyColor: UIColor = ThemeManager.shared.color.gray1 {
        didSet {
            bodyLabel.textColor = bodyColor
        }
    }
    
    
    // MARK: - Override
    override var nibName: String? {
        get {
            return "Card6"
        }
    }
    
    override internal func prepare() {
        super.prepare()
        
        imageView.image = image
        imageView.backgroundColor = ThemeManager.shared.color.gray4
        
        avatarImageView.image = avatarImage
        avatarImageView.backgroundColor = ThemeManager.shared.color.gray4
        
        titleLabel.text = titleText
        titleLabel.font = titleFont
        titleLabel.textColor = titleColor
        
        subtitleLabel.text = subtitleText
        subtitleLabel.font = subtitleFont
        subtitleLabel.textColor = subtitleColor
        
        bodyLabel.text = bodyText
        bodyLabel.font = bodyFont
        bodyLabel.textColor = bodyColor
    }
}
