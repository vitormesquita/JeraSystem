//
//  Card3.swift
//  JeraSystem
//
//  Created by Victor Pereira on 12/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

/**
 A card with image, title, body and button.
 Needs a callback implementation.
 */
@IBDesignable
class Card3: CardView {
    
    // MARK: - Callback
    open var callback: Card3Protocol?
    
    // MARK: - Outlet
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    @IBOutlet private weak var button: RaisedButton!
    @IBOutlet private  weak var imageConstraintHeight: NSLayoutConstraint!
    
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
    
    @IBInspectable
    open var buttonTitle: String = "Button" {
        didSet {
            button.setTitle(buttonTitle, for: .normal)
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
    open var titleText: String = "Card 3 Title" {
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
    
    /// The maximum number of lines to use for rendering text.
    @IBInspectable
    open var bodyNumberOfLines: Int = 1 {
        didSet {
            bodyLabel.numberOfLines = bodyNumberOfLines
        }
    }
    
    /// The current text that is displayed by the label
    @IBInspectable
    open var bodyText: String = "Card 3 Body" {
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
    
    // MARK: - Override
    override var nibName: String? {
        get {
            return "Card3"
        }
    }
    
    override internal func prepare() {
        super.prepare()
        
        imageView.image = image
        imageView.backgroundColor = imageBackgroundColor
        
        titleLabel.numberOfLines = titleNumberOfLines
        titleLabel.font = titleFont
        titleLabel.textColor = titleColor
        titleLabel.text = titleText
        
        bodyLabel.numberOfLines = bodyNumberOfLines
        bodyLabel.font = bodyFont
        bodyLabel.textColor = bodyColor
        bodyLabel.text = bodyText
        
        button.setTitle(buttonTitle, for: .normal)
        button.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)
    }
}

// MARK: - Protocol
protocol Card3Protocol {
    func onButtonClick()
}

// MARK: - objc func
extension Card3 {
    @objc func onButtonClick() {
        guard let callback = callback else { return }
        callback.onButtonClick()
    }
}

