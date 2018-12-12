//
//  Card3.swift
//  JeraSystem
//
//  Created by Victor Pereira on 12/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

@IBDesignable
class Card3: CardView {
    
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
    
    // TODO: set text font and color
    
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
        titleLabel.text = titleText
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
