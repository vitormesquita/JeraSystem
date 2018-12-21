//
//  Card8.swift
//  LearningSwift
//
//  Created by Victor Pereira on 20/12/18.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

/**
 A card with overline, title, body, image and clickable image
 */
@IBDesignable
class Card8: CardView {
    
    // MARK: - Callback
    open var callback: Card8Protocol?
    
    // MARK: - Outlet
    @IBOutlet weak var overlineLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var clickableImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Inspectable
    /// The current text that is displayed by the label
    @IBInspectable
    open var overlineText: String = "Card 8 Overline" {
        didSet {
            overlineLabel.text = overlineText
        }
    }
    
    /// The font used to display the text.
    @IBInspectable
    open var overlineFont: UIFont = ThemeManager.shared.font.caption {
        didSet {
            overlineLabel.font = overlineFont
        }
    }
    
    /// The color of the text.
    @IBInspectable
    open var overlineColor: UIColor = ThemeManager.shared.color.gray3 {
        didSet {
            overlineLabel.textColor = overlineColor
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
    
    /// The maximum number of lines to use for rendering text.
    @IBInspectable
    open var bodyNumberOfLines: Int = 1 {
        didSet {
            bodyLabel.numberOfLines = bodyNumberOfLines
        }
    }
    
    /// The current text that is displayed by the label
    @IBInspectable
    open var titleText: String = "Card 8 Title" {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    /// The font used to display the text.
    @IBInspectable
    open var titleFont: UIFont = ThemeManager.shared.font.headline5 {
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
    open var bodyText: String = "Card 8 Body" {
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
    open var bodyColor: UIColor = ThemeManager.shared.color.gray3 {
        didSet {
            bodyLabel.textColor = bodyColor
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
    
    // MARK: - Init
    init(callback: Card8Protocol) {
        super.init(frame: .zero)
        
        self.callback = callback
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Override
    override var nibName: String? {
        get {
            return "Card8"
        }
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

// MARK: - Protocol
protocol Card8Protocol {
    func onImageClick()
}

// MARK: - objc func
extension Card8 {
    @objc func onImageClick() {
        guard let callback = callback else { return }
        callback.onImageClick()
    }
}
