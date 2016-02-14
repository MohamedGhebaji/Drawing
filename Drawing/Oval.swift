//
//  Oval.swift
//  Drawing
//
//  Created by Mohamed on 14/02/2016.
//  Copyright © 2016 Mohamed. All rights reserved.
//

import UIKit
struct Oval: Drawable {
    let x: Double
    let y: Double
    let width: Double
    let height: Double
    
    
    func draw(context: CGContext) {
        let rect = CGRect(x: x, y: y, width: width, height: height)
        CGContextAddEllipseInRect(context, rect)
    }
}