//
//  Card5.swift
//  JeraSystem
//
//  Created by Victor Pereira on 13/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

// MARK: - Delegate
protocol Card5Delegate: class {
    func onButtonClick()
    func onImageClick()
}

/**
 A card with image, body, clickable image and button.
 Needs a delegate implementation.
 */
@IBDesignable
class Card5: CardView {
    
    // MARK: - Delegate
    open weak var delegate: Card5Delegate?
    
    // MARK: - Outlet
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var clickableImageView: UIImageView!
    @IBOutlet weak var button: FlatButton!
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
    
    /// The view's background color.
    @IBInspectable
    open var clickableImageBackgroundColor: UIColor = ThemeManager.shared.color.gray4 {
        didSet { clickableImageView.backgroundColor = clickableImageBackgroundColor }
    }
    
    ///The image displayed in image view.
    @IBInspectable
    open var clickableImage: UIImage? {
        didSet { clickableImageView.image = clickableImage }
    }
    
    @IBInspectable
    open var buttonTitle: String? {
        get { return button.title(for: .normal) }
        set { button.setTitle(newValue, for: .normal) }
    }
    
    /// The maximum number of lines to use for rendering text.
    @IBInspectable
    open var bodyNumberOfLines: Int = 1 {
        didSet { bodyLabel.numberOfLines = bodyNumberOfLines }
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
    open var bodyColor: UIColor = ThemeManager.shared.color.primary {
        didSet { bodyLabel.textColor = bodyColor }
    }
    
    //MARK: - Override
    override var nibName: String? {
        return "Card5"
    }
    
    override internal func prepare() {
        super.prepare()
        
        imageView.image = image
        imageView.backgroundColor = imageBackgroundColor
        
        bodyLabel.numberOfLines = bodyNumberOfLines
        bodyLabel.font = bodyFont
        bodyLabel.textColor = bodyColor
        bodyLabel.text = bodyText
        
        clickableImageView.image = clickableImage
        clickableImageView.backgroundColor = clickableImageBackgroundColor
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onImageClick))
        clickableImageView.addGestureRecognizer(gestureRecognizer)
        clickableImageView.isUserInteractionEnabled = true
        
        button.setTitle(buttonTitle, for: .normal)
        button.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)
    }
}

// MARK: - objc func
extension Card5 {
    
    @objc func onButtonClick() {
        delegate?.onButtonClick()
    }
    
    @objc func onImageClick() {
        delegate?.onImageClick()
    }
}
