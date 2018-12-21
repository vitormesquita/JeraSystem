//
//  CardView.swift
//  JeraSystem
//
//  Created by Vitor Mesquita on 04/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    internal var contentView: UIView?
    internal var configurableConstraints = [NSLayoutConstraint]()
    
    internal var nibName: String? {
        get {
            return nil
        }
    }
    
    private var shadow: Shadow = .shadow12 {
        didSet {
            configureShadow()
        }
    }
    
    // MARK: - Inspectable
    @IBInspectable
    open var cornerRadius: CGFloat = 8 {
        didSet {
            layer.cornerRadius = cornerRadius
            
            guard let contentView = contentView else { return }
            contentView.layer.cornerRadius = cornerRadius
        }
    }
 
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    // MARK: - Override
    override func awakeFromNib() {
        super.awakeFromNib()
        prepare()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        prepare()
        contentView?.prepareForInterfaceBuilder()
        
        // Necessary to correctly render
        translatesAutoresizingMaskIntoConstraints = true
    }
    
    // MARK: - Internal
    /// Called when object is initialized to apply initial configuration
    internal func prepare() {
        backgroundColor = .white
        layer.cornerRadius = cornerRadius
        
        configureShadow()
        
        guard let nibName = nibName else { return }
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        guard let contentView = (nib.instantiate(withOwner: self, options: nil).first as? UIView) else { return }
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.backgroundColor = .clear
        
        addSubview(contentView)
    }
}

// MARK - Private func
extension CardView {
    
    /**
     */
    private func configureShadow() {
        layer.shadowOpacity = shadow.opacity
        layer.shadowOffset = shadow.offeset
    }
}
