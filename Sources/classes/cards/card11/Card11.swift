//
//  Card11.swift
//  LearningSwift
//
//  Created by Victor Pereira on 20/12/18.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

/**
 A card with avatar, title, subtitle, clickable image, image, body and two buttons.
 Needs a callback implementation.
 */
@IBDesignable
class Card11: CardView {
    
    // MARK: - Callback
    open var callback: Card11Protocol?
    
    // MARK: - Outlet
    @IBOutlet weak var clickableImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var leftButton: FlatButton!
    @IBOutlet weak var rightButton: FlatButton!
    @IBOutlet weak var imageConstraintHeight: NSLayoutConstraint!
    
    // MARK: - Inspectable
    /// The current text that is displayed by the label
    @IBInspectable
    open var subtitleText: String = "Card 11 subtitle" {
        didSet {
            subtitleLabel.text = subtitleText
        }
    }
    
    /// The font used to display the text.
    @IBInspectable
    open var subtitleFont: UIFont = ThemeManager.shared.font.caption {
        didSet {
            subtitleLabel.font = subtitleFont
        }
    }
    
    /// The color of the text.
    @IBInspectable
    open var subtitleColor: UIColor = ThemeManager.shared.color.gray3 {
        didSet {
            subtitleLabel.textColor = subtitleColor
        }
    }
    
    /// The maximum number of lines to use for rendering text.
    @IBInspectable
    open var subtitleNumberOfLines: Int = 1 {
        didSet {
            subtitleLabel.numberOfLines = subtitleNumberOfLines
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
    
    @IBInspectable
    open var leftButtonTitle: String = "Button" {
        didSet {
            setLeftButtonTitle()
        }
    }
    
    @IBInspectable
    open var rightButtonTitle: String = "Button" {
        didSet {
            setRightButtonTitle()
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
    open var titleText: String = "Card 11 Title" {
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
    
    /// The maximum number of lines to use for rendering text.
    @IBInspectable
    open var titleNumberOfLines: Int = 1 {
        didSet {
            titleLabel.numberOfLines = titleNumberOfLines
        }
    }
    
    /// The current text that is displayed by the label
    @IBInspectable
    open var bodyText: String = "Card 11 Body" {
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
    
    /// The image height.
    @IBInspectable
    open var imageHeight: CGFloat = 194 {
        didSet {
            imageConstraintHeight.constant = imageHeight
            updateConstraints()
        }
    }
    
    // MARK: - Override
    override var nibName: String? {
        get {
            return "Card11"
        }
    }
    
    override internal func prepare() {
        super.prepare()
        
        subtitleLabel.text = subtitleText
        subtitleLabel.textColor = subtitleColor
        subtitleLabel.font = subtitleFont
        subtitleLabel.numberOfLines = subtitleNumberOfLines
        
        imageView.image = image
        imageView.backgroundColor = imageBackgroundColor
        
        
        titleLabel.text = titleText
        titleLabel.font = titleFont
        titleLabel.textColor = titleColor
        titleLabel.numberOfLines = titleNumberOfLines
        
        bodyLabel.numberOfLines = bodyNumberOfLines
        bodyLabel.font = bodyFont
        bodyLabel.textColor = bodyColor
        bodyLabel.text = bodyText
        
        avatarImageView.backgroundColor = avatarBackgroundColor
        avatarImageView.image = avatarImage
        
        clickableImageView.image = clickableImage
        clickableImageView.backgroundColor = clickableImageBackgroundColor
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onImageClick))
        clickableImageView.addGestureRecognizer(gestureRecognizer)
        clickableImageView.isUserInteractionEnabled = true
        
        setLeftButtonTitle()
        leftButton.addTarget(self, action: #selector(onLeftButtonClick), for: .touchUpInside)
        
        setRightButtonTitle()
        rightButton.addTarget(self, action: #selector(onRightButtonClick), for: .touchUpInside)
        
    }
    
    // MARK: - Private
    private var leftButtonConstraints = [NSLayoutConstraint]()
    private var rightButtonConstraints = [NSLayoutConstraint]()
    
    private func setLeftButtonTitle() {
        NSLayoutConstraint.deactivate(leftButtonConstraints)
        
        leftButton.setTitle(leftButtonTitle, for: .normal)
        leftButtonConstraints = [leftButton.widthAnchor.constraint(equalToConstant: leftButton.intrinsicContentSize.width + 16)]
        
        NSLayoutConstraint.activate(leftButtonConstraints)
    }
    
    private func setRightButtonTitle() {
        NSLayoutConstraint.deactivate(rightButtonConstraints)
        
        rightButton.setTitle(rightButtonTitle, for: .normal)
        rightButtonConstraints = [rightButton.widthAnchor.constraint(equalToConstant: rightButton.intrinsicContentSize.width + 16)]
        
        NSLayoutConstraint.activate(rightButtonConstraints)
    }
}

// MARK: - Protocol
protocol Card11Protocol {
    func onLeftButtonClick()
    func onRightButtonClick()
    func onImageClick()
}

// MARK: - objc func
extension Card11 {
    @objc func onLeftButtonClick() {
        guard let callback = callback else { return }
        callback.onLeftButtonClick()
    }
    
    @objc func onRightButtonClick() {
        guard let callback = callback else { return }
        callback.onRightButtonClick()
    }
    
    @objc func onImageClick() {
        guard let callback = callback else { return }
        callback.onImageClick()
    }
}
