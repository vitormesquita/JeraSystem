//
//  FlatButton.swift
//  JeraSystem
//
//  Created by Victor Pereira on 05/12/18.
//  Copyright © 2018 Vitor Mesquita. All rights reserved.
//

import UIKit

@IBDesignable
public class FlatButton: Button {
  
    override public func prepare() {
        super.prepare()        
        self.backgroundColor = .clear
    }
}
