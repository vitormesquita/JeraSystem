//
//  Card5.swift
//  JeraSystem
//
//  Created by Victor Pereira on 13/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

/**
 A card with image, body, clickable image and button.
 Needs a callback implementation.
 */
@IBDesignable
class Card5: CardView {
    
    // MARK: - Callback
    open var callback: Card5Protocol?
    
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
    
    @IBInspectable
    open var buttonTitle: String = "Button" {
        didSet {
            button.setTitle(buttonTitle, for: .normal)
        }
    }
    
    /// The maximum number of lines to use for rendering text.
    @IBInspectable
    open var bodyNumberOfLines: Int = 1 {
        didSet {
            bodyLabel.numberOfLines = bodyNumberOfLines
        }
    }
    
    /// The current text that is displayed by the label
    @IBInspectable
    open var bodyText: String = "Card 5 Body" {
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
    open var bodyColor: UIColor = ThemeManager.shared.color.primary {
        didSet {
            bodyLabel.textColor = bodyColor
        }
    }
    
    //MARK: - Override
    override var nibName: String? {
        get {
            return "Card5"
        }
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

// MARK: - Protocol
protocol Card5Protocol {
    func onButtonClick()
    func onImageClick()
}

// MARK: - objc func
extension Card5 {
    @objc func onButtonClick() {
        guard let callback = callback else { return }
        callback.onButtonClick()
    }
    
    @objc func onImageClick() {
        guard let callback = callback else { return }
        callback.onImageClick()
    }
}
