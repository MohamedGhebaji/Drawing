//
//  Line.swift
//  Drawing
//
//  Created by Mohamed on 14/02/2016.
//  Copyright © 2016 Mohamed. All rights reserved.
//

import UIKit
struct Line: Drawable {
    let startPoint: CGPoint
    let endPoint: CGPoint
    
    func draw(context: CGContext) {
        CGContextAddLines(context, [startPoint, endPoint], 2)
    }
}
