//
//  Button.swift
//  JeraSystem
//
//  Created by Vitor Mesquita on 10/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

@IBDesignable
open class Button: UIButton {
    
    private var pulse: Pulse!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    func getCornerRadiusByType() -> CGFloat {
        switch cornerRadius {
        case .none:
            return 0
            
        case .simple:
            return 4
            
        case .circle:
            return self.bounds.size.height / 2
        }
    }
    
    //MARK: - open
    
    @IBInspectable
    open var image: UIImage? {
        didSet {
            setImage(image, for: .normal)
            setImage(image, for: .selected)
            setImage(image, for: .highlighted)
            setImage(image, for: .disabled)
            
            if #available(iOS 9, *) {
                setImage(image, for: .application)
                setImage(image, for: .focused)
                setImage(image, for: .reserved)
            }
        }
    }
    
    open var cornerRadius: Corner = Corner.simple {
        didSet {
            layer.cornerRadius = getCornerRadiusByType()
        }
    }
    
    open func prepare() {
        pulse = Pulse(layer: self.layer)
        
        semanticContentAttribute = .forceLeftToRight
        layer.cornerRadius = getCornerRadiusByType()
        tintColor = ThemeManager.shared.color.primary
    }
}

// MARK: - Pulse animation
extension Button: CAAnimationDelegate {
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        pulse.expand(frame: self.bounds)
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        pulse.contract()
    }
}
