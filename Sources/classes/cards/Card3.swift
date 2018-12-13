//
//  Card3.swift
//  JeraSystem
//
//  Created by Victor Pereira on 12/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

protocol Cad3SubmitProtocol {
    func onSubmitButtonClick()
}

@IBDesignable
class Card3: CardView {
    
    private var callback: Cad3SubmitProtocol?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var button: RaisedButton!

    @IBOutlet weak var imageConstraintHeight: NSLayoutConstraint!
    
    @IBInspectable
    open var imageHeight: CGFloat = 240 {
        didSet {
            imageConstraintHeight.constant = imageHeight
            updateConstraints()
        }
    }
    
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
    
    @IBInspectable
    open var titleText: String = "Title" {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    @IBInspectable
    open var bodyText: String = "Body" {
        didSet {
            bodyLabel.text = bodyText
        }
    }
    
    @IBInspectable
    open var titleFont: UIFont = ThemeManager.shared.font.headline6 {
        didSet {
            titleLabel.font = titleFont
        }
    }
    
    @IBInspectable
    open var bodyFont: UIFont = ThemeManager.shared.font.body2 {
        didSet {
            bodyLabel.font = bodyFont
        }
    }
    
    @IBInspectable
    open var titleColor: UIColor = ThemeManager.shared.color.primary {
        didSet {
            titleLabel.textColor = titleColor
        }
    }
    
    @IBInspectable
    open var bodyColor: UIColor = ThemeManager.shared.color.primary {
        didSet {
            bodyLabel.textColor = bodyColor
        }
    }
    
    init(callback: Cad3SubmitProtocol) {
        super.init(frame: .zero)
        
        self.callback = callback
        
        button.addTarget(self, action: #selector(onSubmitButtonClick), for: UIControl.Event.touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    let nibName = "Card3"
    var contentView: UIView!
    
    override func prepare() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        self.contentView = (nib.instantiate(withOwner: self, options: nil).first as! UIView)
        addSubview(contentView)

        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        imageConstraintHeight.constant = imageHeight
        imageView.image = image
        imageView.backgroundColor = ThemeManager.shared.color.gray4
        button.setTitle(buttonTitle, for: .normal)
        
        titleLabel.font = titleFont
        titleLabel.textColor = titleColor
        titleLabel.text = titleText
        
        bodyLabel.font = bodyFont
        bodyLabel.textColor = bodyColor
        bodyLabel.text = bodyText
        
        super.prepare()
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.deactivate(configurableConstraints)
        
        configurableConstraints = [
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.leftAnchor.constraint(equalTo: self.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: self.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(configurableConstraints)
    }
}

extension Card3 {
    @objc func onSubmitButtonClick() {
        guard let callback = callback else { return }
        callback.onSubmitButtonClick()
    }
}

