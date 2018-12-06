//
//  UIButtonExtensions.swift
//  JeraSystem
//
//  Created by Victor Pereira on 06/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

extension UIButton: CAAnimationDelegate {
    open override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let tapLocation = touch.location(in: self)
        let initialSize: CGFloat = 10.0
        
        let animationLayer = CALayer()
        animationLayer.backgroundColor = ThemeManager.shared.color.primary.cgColor
        animationLayer.frame = CGRect(x: 0, y: 0, width: initialSize, height: initialSize)
        animationLayer.cornerRadius = initialSize/2
        animationLayer.position = tapLocation
        
        let basicAnimation = CABasicAnimation(keyPath: "transform.scale")
        basicAnimation.toValue = 40
        
        let fadeAnimation = CAKeyframeAnimation(keyPath: "opacity")
        fadeAnimation.values = [0.16, 0.08, 0.0]
        
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
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let layer: CALayer? = anim.value(forKeyPath: "animationLayer") as? CALayer
        if layer != nil{
            layer?.removeAnimation(forKey: "scale")
            layer?.removeFromSuperlayer()
        }
    }
}
