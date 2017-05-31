//
//  ViewController.swift
//  DrawBoard
//
//  Created by Sahil Gangele on 5/29/17.
//  Copyright © 2017 Sahil Gangele. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var panGesture: UIPanGestureRecognizer!
    
    let line = UIBezierPath()
    let shape = CAShapeLayer()
    @IBOutlet weak var imageView: UIImageView!
    var hasBeenTouched: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.alpha = 0.0
        line.lineWidth = 3.0
        line.lineJoinStyle = .round
        line.lineCapStyle = .round
        line.stroke(with: .color, alpha: 1.0)
        shape.strokeColor = UIColor.red.cgColor
        shape.path = line.cgPath
        shape.lineWidth = 5.0
        shape.lineCap = "round"
        shape.fillColor = UIColor.red.cgColor
        self.view.layer.insertSublayer(shape, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func clearDrawing(_ sender: Any) {
        self.imageView.image = nil
        self.line.removeAllPoints()
    }
    
    @IBAction func draw(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: self.view)
        print("\(location.x), \(location.y)")
        let rendered = UIGraphicsImageRenderer(size: self.view.frame.size)
        let image = rendered.image(actions: {context in
            line.stroke()
            self.imageView.image = context.currentImage
            if(hasBeenTouched == false) {
                line.move(to: CGPoint(x: location.x, y: location.y))
                self.hasBeenTouched = true
            }
            let point = CGPoint(x: location.x, y: location.y)
            line.addLine(to: point)
        })
        switch sender.state {
        case .ended:
            self.hasBeenTouched = false
            break
        default:
            break
        }
    }
}

