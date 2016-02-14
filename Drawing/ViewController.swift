//
//  ViewController.swift
//  Drawing
//
//  Created by Mohamed on 14/02/2016.
//  Copyright © 2016 Mohamed. All rights reserved.
//

import UIKit

enum ShapeType: Int {
    case Rect, Oval, Line
}

class ViewController: UIViewController {
    @IBOutlet private weak var drawingView: DrawingView!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Actions
    @IBAction func changeShapeAction(sender: UISegmentedControl) {
        drawingView.shapeType = ShapeType(rawValue: sender.selectedSegmentIndex) ?? .Rect
    }
}

