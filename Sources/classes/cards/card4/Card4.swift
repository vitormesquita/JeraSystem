//
//  Card4.swift
//  JeraSystem
//
//  Created by Victor Pereira on 13/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

/**
 A card with image, avatar, title and clickable image.
 Needs a callback implementation.
 */
@IBDesignable
class Card4: CardView {
    
    // MARK: - Callback
    open var callback: Card4Protocol?
    
    // MARK: - Outlet
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var clickableImageView: UIImageView!
    @IBOutlet weak var imageConstraintHeight: NSLayoutConstraint!
    
    // MARK: - Inspectable
    /// The view's background color.
    @IBInspectable
    open var imageBackgroundColor: UIColor = ThemeManager.shared.color.gray4 {
        didSet {
            imageView.backgroundColor = imageBackgroundColor
        }
    }
    
    /// The image height.
    @IBInspectable
    open var imageHeight: CGFloat = 240 {
        didSet {
            imageConstraintHeight.constant = imageHeight
            updateConstraints()
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
    
    /// The view's background color.
    @IBInspectable
    open var clickableImageBackgroundColor: UIColor = ThemeManager.shared.color.gray4 {
        didSet {
            clickableImageView.backgroundColor = clickableImageBackgroundColor
        }
    }
    
    ///The image displayed in image view.
    @IBInspectable
    open var clickableImage: UIImage = UIImage() {
        didSet {
            clickableImageView.image = clickableImage
        }
    }
    
    /// The maximum number of lines to use for rendering text.
    @IBInspectable
    open var titleNumberOfLines: Int = 1 {
        didSet {
            titleLabel.numberOfLines = titleNumberOfLines
        }
    }
    
    /// The current text that is displayed by the label
    @IBInspectable
    open var titleText: String = "Card 4 Title" {
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
    open var titleColor: UIColor = ThemeManager.shared.color.primary {
        didSet {
            titleLabel.textColor = titleColor
        }
    }

    // MARK: - Override
    override var nibName: String? {
        get {
            return "Card4"
        }
    }
    
    override internal func prepare() {
        super.prepare()
        
        imageView.image = image
        imageView.backgroundColor = imageBackgroundColor
        
        avatarImageView.image = avatarImage
        avatarImageView.backgroundColor = avatarBackgroundColor
        
        titleLabel.numberOfLines = titleNumberOfLines
        titleLabel.font = titleFont
        titleLabel.textColor = titleColor
        titleLabel.text = titleText
        
        clickableImageView.image = clickableImage
        clickableImageView.backgroundColor = clickableImageBackgroundColor
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onImageClick))
        clickableImageView.addGestureRecognizer(gestureRecognizer)
        clickableImageView.isUserInteractionEnabled = true
    }
}

// MARK: - Protocol
protocol Card4Protocol {
    func onImageClick()
}

// MARK: - objc func
extension Card4 {
    @objc func onImageClick() {
        guard let callback = callback else { return }
        callback.onImageClick()
    }
}
