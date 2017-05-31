//
//  Pen.swift
//  DrawBoard
//
//  Created by Sahil Gangele on 5/29/17.
//  Copyright © 2017 Sahil Gangele. All rights reserved.
//

import UIKit


public class Pen {
    
    // TODO: Have to find out what to do with inkColor
    public var inkColor: UIColor
    public var inkThickness: CGFloat
    public var paper: UIView
    

    init(inkColor: UIColor, inkThickness: CGFloat, paper: UIView) {
        self.inkThickness = inkThickness
        self.inkColor = inkColor
        self.paper = paper
    }
    
    func draw(coordX: CGFloat, coordY: CGFloat) {
        var line = UIBezierPath()
        line.addLine(to: CGPoint(x: coordX, y: coordY))
        line.lineWidth = 3.0
        line.stroke()
        
        
        
        
    }
    
    
    
}
