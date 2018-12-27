//
//  Card4.swift
//  JeraSystem
//
//  Created by Victor Pereira on 13/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

// MARK: - Delegate
protocol Card4Delegate: class {
    func onImageClick()
}

/**
 A card with image, avatar, title and clickable image.
 Needs a delegate implementation.
 */
@IBDesignable
class Card4: CardView {
    
    // MARK: - Delegate
    open weak var delegate: Card4Delegate?
    
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
        didSet { imageView.backgroundColor = imageBackgroundColor }
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
    open var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }
    
    ///The image displayed in image view.
    @IBInspectable
    open var avatarImage: UIImage? {
        get { return avatarImageView.image }
        set { avatarImageView.image = newValue }
    }
    
    /// The view's background color.
    @IBInspectable
    open var avatarBackgroundColor: UIColor = ThemeManager.shared.color.gray4 {
        didSet { avatarImageView.backgroundColor = avatarBackgroundColor }
    }
    
    /// The view's background color.
    @IBInspectable
    open var clickableImageBackgroundColor: UIColor = ThemeManager.shared.color.gray4 {
        didSet { clickableImageView.backgroundColor = clickableImageBackgroundColor }
    }
    
    ///The image displayed in image view.
    @IBInspectable
    open var clickableImage: UIImage? {
        get { return clickableImageView.image }
        set { clickableImageView.image = newValue }
    }
    
    /// The maximum number of lines to use for rendering text.
    @IBInspectable
    open var titleNumberOfLines: Int = 1 {
        didSet { titleLabel.numberOfLines = titleNumberOfLines }
    }
    
    /// The current text that is displayed by the label
    @IBInspectable
    open var titleText: String? {
        get { return titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    /// The font used to display the text.
    @IBInspectable
    open var titleFont: UIFont = ThemeManager.shared.font.headline6 {
        didSet { titleLabel.font = titleFont }
    }
    
    /// The color of the text.
    @IBInspectable
    open var titleColor: UIColor = ThemeManager.shared.color.primary {
        didSet { titleLabel.textColor = titleColor }
    }

    // MARK: - Override
    override var nibName: String? {
        return "Card4"
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

// MARK: - objc func
extension Card4 {
    
    @objc func onImageClick() {
        delegate?.onImageClick()
    }
}
