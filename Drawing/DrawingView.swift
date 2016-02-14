//
//  DrawingView.swift
//  Drawing
//
//  Created by Mohamed on 14/02/2016.
//  Copyright © 2016 Mohamed. All rights reserved.
//

import UIKit

class DrawingView: UIView {

    var shapeType: ShapeType = .Rect
    var shapes = [Drawable]()
    var fistTouchLocation: CGPoint!
    var shape: Drawable?
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 1.0)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let components: [CGFloat] = [0.0, 0.0, 1.0, 1.0]
        let color = CGColorCreate(colorSpace, components)
        CGContextSetStrokeColorWithColor(context, color)
        
        shapes.forEach{ $0.draw(context!) }
        shape?.draw(context!)
        CGContextStrokePath(context);
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first! as UITouch
        let location = touch.locationInView(self)
        fistTouchLocation = location
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first! as UITouch
        let location = touch.locationInView(self)
        
        let width = (location.x > fistTouchLocation.x) ? Double(location.x - fistTouchLocation.x) : -Double(fistTouchLocation.x - location.x)
        let height = (location.y > fistTouchLocation.y) ? Double(location.y - fistTouchLocation.y) : -Double(fistTouchLocation.y - location.y)
        switch shapeType {
        case .Rect:
            shape = Rect(x: Double(fistTouchLocation.x), y: Double(fistTouchLocation.y), width: width, height: height)
        case .Oval:
            shape = Oval(x: Double(fistTouchLocation.x), y: Double(fistTouchLocation.y), width: width, height: height)
        case .Line:
            shape = Line(startPoint: fistTouchLocation, endPoint: location)
        }
        setNeedsDisplay()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let shape = shape {
            shapes.append(shape)
        }
    }

}
