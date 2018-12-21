//
//  Card9.swift
//  LearningSwift
//
//  Created by Victor Pereira on 13/12/18.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

/**
 A card with title, body, image and two buttons
 */
@IBDesignable
class Card9: CardView {
    
    // MARK: - Callback
    open var callback: Card9Protocol?
    
    // MARK: - Outlet
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var leftButton: FlatButton!
    @IBOutlet weak var rightButton: FlatButton!
    
    // MARK: - Inspectable
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
            leftButton.setTitle(leftButtonTitle, for: .normal)
        }
    }
    
    @IBInspectable
    open var rightButtonTitle: String = "Button" {
        didSet {
            rightButton.setTitle(rightButtonTitle, for: .normal)
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
    open var titleText: String = "Card 9 Title" {
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
    open var bodyText: String = "Card 9 Body" {
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
    
    // MARK: - Init
    init(callback: Card9Protocol) {
        super.init(frame: .zero)
        
        self.callback = callback
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Override
    override var nibName: String? {
        get {
            return "Card9"
        }
    }
    
    override internal func prepare() {
        super.prepare()
        
        imageView.image = image
        imageView.backgroundColor = imageBackgroundColor
        
        
        titleLabel.text = titleText
        titleLabel.font = titleFont
        titleLabel.textColor = titleColor
        
        bodyLabel.numberOfLines = bodyNumberOfLines
        bodyLabel.font = bodyFont
        bodyLabel.textColor = bodyColor
        bodyLabel.text = bodyText
        
        
        leftButton.setTitle(leftButtonTitle, for: .normal)
        leftButton.addTarget(self, action: #selector(onLeftButtonClick), for: .touchUpInside)
        
        rightButton.setTitle(leftButtonTitle, for: .normal)
        rightButton.addTarget(self, action: #selector(onRightButtonClick), for: .touchUpInside)
    }
}

// MARK: - Protocol
protocol Card9Protocol {
    func onLeftButtonClick()
    func onRightButtonClick()
}

// MARK: - objc func
extension Card9 {
    @objc func onLeftButtonClick() {
        guard let callback = callback else { return }
        callback.onLeftButtonClick()
    }
    
    @objc func onRightButtonClick() {
        guard let callback = callback else { return }
        callback.onRightButtonClick()
    }
}
