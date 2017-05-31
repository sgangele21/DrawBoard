//
//  Circle.swift
//  DrawBoard
//
//  Created by Sahil Gangele on 5/29/17.
//  Copyright © 2017 Sahil Gangele. All rights reserved.
//

import UIKit

public class Circle: UIView {
    
    public var radius: CGFloat {
        return self.frame.width / 2.0
    }
    
    convenience init(radius: CGFloat) {
        let diameter = radius * 2
        let rect = CGRect(x: 0.0, y: 0.0, width: diameter , height: diameter)
        self.init(frame: rect)
        self.layer.cornerRadius = self.frame.width / 2
    }

    
}
