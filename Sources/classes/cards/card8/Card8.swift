//
//  Card8.swift
//  LearningSwift
//
//  Created by Victor Pereira on 20/12/18.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

// MARK: - Delegate
protocol Card8Delegate: class {
    func onImageClick()
}

/**
 A card with overline, title, body, image and clickable image.
 Needs a delegate implementation.
 */
@IBDesignable
class Card8: CardView {
    
    // MARK: - Delegate
    open weak var delegate: Card8Delegate?
    
    // MARK: - Outlet
    @IBOutlet weak var overlineLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var clickableImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Inspectable
    /// The current text that is displayed by the label
    @IBInspectable
    open var overlineText: String? {
        get { return overlineLabel.text }
        set { overlineLabel.text = newValue }
    }
    
    /// The font used to display the text.
    @IBInspectable
    open var overlineFont: UIFont = ThemeManager.shared.font.caption {
        didSet { overlineLabel.font = overlineFont }
    }
    
    /// The color of the text.
    @IBInspectable
    open var overlineColor: UIColor = ThemeManager.shared.color.gray3 {
        didSet { overlineLabel.textColor = overlineColor }
    }
    
    /// The view's background color.
    @IBInspectable
    open var imageBackgroundColor: UIColor = ThemeManager.shared.color.gray4 {
        didSet { imageView.backgroundColor = imageBackgroundColor }
    }
    
    ///The image displayed in image view.
    @IBInspectable
    open var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }
    
    /// The maximum number of lines to use for rendering text.
    @IBInspectable
    open var bodyNumberOfLines: Int = 1 {
        didSet { bodyLabel.numberOfLines = bodyNumberOfLines }
    }
    
    /// The current text that is displayed by the label
    @IBInspectable
    open var titleText: String? {
        get { return titleLabel.text }
        set { titleLabel.text = newValue }
    }
    
    /// The font used to display the text.
    @IBInspectable
    open var titleFont: UIFont = ThemeManager.shared.font.headline5 {
        didSet { titleLabel.font = titleFont }
    }
    
    /// The color of the text.
    @IBInspectable
    open var titleColor: UIColor = ThemeManager.shared.color.gray2 {
        didSet { titleLabel.textColor = titleColor }
    }
    
    /// The current text that is displayed by the label
    @IBInspectable
    open var bodyText: String? {
        get { return bodyLabel.text }
        set { bodyLabel.text = newValue }
    }
    
    /// The font used to display the text.
    @IBInspectable
    open var bodyFont: UIFont = ThemeManager.shared.font.body2 {
        didSet { bodyLabel.font = bodyFont }
    }
    
    /// The color of the text.
    @IBInspectable
    open var bodyColor: UIColor = ThemeManager.shared.color.gray3 {
        didSet { bodyLabel.textColor = bodyColor }
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
    
    // MARK: - Override
    override var nibName: String? {
        return "Card8"
    }
    
    override internal func prepare() {
        super.prepare()
        
        overlineLabel.text = overlineText
        overlineLabel.textColor = overlineColor
        overlineLabel.font = overlineFont
        
        imageView.image = image
        imageView.backgroundColor = imageBackgroundColor
        
        
        titleLabel.text = titleText
        titleLabel.font = titleFont
        titleLabel.textColor = titleColor
        
        bodyLabel.numberOfLines = bodyNumberOfLines
        bodyLabel.font = bodyFont
        bodyLabel.textColor = bodyColor
        bodyLabel.text = bodyText
        
        clickableImageView.image = clickableImage
        clickableImageView.backgroundColor = clickableImageBackgroundColor
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onImageClick))
        clickableImageView.addGestureRecognizer(gestureRecognizer)
        clickableImageView.isUserInteractionEnabled = true
    }
}

// MARK: - objc func
extension Card8 {
    
    @objc func onImageClick() {
        delegate?.onImageClick()
    }
}
