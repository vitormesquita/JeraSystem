//
//  Pulse.swift
//  JeraSystem
//
//  Created by Vitor Mesquita on 10/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

class Pulse: NSObject {
    
    private var pulseLayer: CALayer
    private let layer = CALayer()
    
    init(layer: CALayer) {
        self.pulseLayer = layer
        super.init()
        pulseLayer.masksToBounds = true
    }
    
    public func expand(frame: CGRect) {
        //        layer.removeFromSuperlayer()
        //
        //        layer.frame = frame
        //        layer.backgroundColor = ThemeManager.shared.color.primaryLight.withAlphaComponent(0.5).cgColor
        //
        //        let animation = CABasicAnimation(keyPath: "opacity")
        //        animation.toValue = 1
        //        animation.fromValue = 0
        //        animation.isRemovedOnCompletion = true
        //
        //        layer.add(animation, forKey: "fade_in")
        //
        //        pulseLayer.insertSublayer(layer, at: 0)
    }
    
    public func contract() {
        //        let animation = CABasicAnimation(keyPath: "opacity")
        //        animation.toValue = 0
        //        animation.fromValue = 1
        //        animation.delegate = self
        //        animation.isRemovedOnCompletion = true
        //        layer.add(animation, forKey: "fade_out")
    }
}

extension Pulse: CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        layer.removeFromSuperlayer()
    }
}
