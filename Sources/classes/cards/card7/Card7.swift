//
//  Card7.swift
//  LearningSwift
//
//  Created by Victor Pereira on 14/12/18.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

/**
 A card with overline, title, body, image and two buttons.
 Needs a callback implementation.
 */
@IBDesignable
class Card7: CardView {
    
    // MARK: - Callback
    open var callback: Card7Protocol?
    
    // MARK: - Outlet
    @IBOutlet weak var overlineLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var leftButton: FlatButton!
    @IBOutlet weak var rightButton: FlatButton!
    
    // MARK: - Inspectable
    /// The current text that is displayed by the label
    @IBInspectable
    open var overlineText: String = "Card 7 Overline" {
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
    open var titleText: String = "Card 7 Title" {
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
    open var bodyText: String = "Card 7 Body" {
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
    
    // MARK: - Override
    override var nibName: String? {
        get {
            return "Card7"
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
protocol Card7Protocol {
    func onLeftButtonClick()
    func onRightButtonClick()
}

// MARK: - objc func
extension Card7 {
    @objc func onLeftButtonClick() {
        guard let callback = callback else { return }
        callback.onLeftButtonClick()
    }
    
    @objc func onRightButtonClick() {
        guard let callback = callback else { return }
        callback.onRightButtonClick()
    }
}
