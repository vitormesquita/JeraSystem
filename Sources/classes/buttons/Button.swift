//
//  Button.swift
//  JeraSystem
//
//  Created by Vitor Mesquita on 10/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

@IBDesignable
class Button: UIButton {
    
    init() {
        super.init(frame: .zero)
        prepare()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }

    internal func prepare() {
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let tapLocation = touch.location(in: self)
        let initialSize: CGFloat = 10.0
        
        let animationLayer = CALayer()
        animationLayer.backgroundColor = ThemeManager.shared.color.primaryLight.cgColor
        animationLayer.frame = CGRect(x: 0, y: 0, width: initialSize, height: initialSize)
        animationLayer.cornerRadius = initialSize/2
        animationLayer.position = tapLocation
        
        let basicAnimation = CABasicAnimation(keyPath: "transform.scale")
        basicAnimation.toValue = self.bounds.size.height
        
        let fadeAnimation = CAKeyframeAnimation(keyPath: "opacity")
        fadeAnimation.values = [0.32, 0.16, 0.08]
        
        let animationGroup = CAAnimationGroup()
        animationGroup.delegate = self
        animationGroup.duration = 0.5
        animationGroup.animations = [basicAnimation, fadeAnimation]
        animationGroup.setValue(animationLayer, forKey: "animationLayer")
        
        animationLayer.add(animationGroup, forKey: "animationGroup")
        
        self.layer.insertSublayer(animationLayer, below: self.titleLabel?.layer)
        self.layer.masksToBounds = true
        
        return true
    }
}

extension Button: CAAnimationDelegate {
 
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let layer: CALayer? = anim.value(forKeyPath: "animationLayer") as? CALayer
        if layer != nil{
            layer?.removeAnimation(forKey: "scale")
            layer?.removeFromSuperlayer()
        }
    }
}
