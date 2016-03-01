//
//  CDMultiSelectSegmentedController.swift
//  CDMultiSelectSegmentedControl
//
//  Created by Christopher Davis on 2/29/16.
//  Copyright © 2016 D2 Business Alliance, LLC. All rights reserved.
//

import UIKit

/*
@IBDesignable class CDMultiSelectSegmentedController: UIControl {

    private var labels = [UILabel]()
    var thumbView = UIView()
    
    
    var items: [String] = ["Item 1", "Item2", "Item3"] {
        didSet {
            setupLabels()
        }
    }
    
    var selectedIndex : Int = 0 {
        didSet {
            displayNewSelectedIndex()
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder){
        super.init(coder: coder)!
        setupView()
    }
    
    func setupView() {
        layer.cornerRadius = frame.height/2
        layer.borderColor = UIColor.redColor().CGColor
        layer.borderWidth = 2
        
        backgroundColor = UIColor.clearColor()
        setupLabels()
        insertSubview(thumbView, atIndex: 0)
    }
    
    override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        let location = touch.locationInView((self)
        var callculatedIndex: Int?
        for(index, item) in enumerate(label) {
            if item.frame.contain
        }
    }
    
    
    func setupLabels() {
        for label in labels {
            label.removeFromSuperview()
        }
        labels.removeAll(keepCapacity: true)
        
        for index in 1...items.count {
            let label = UILabel(frame: CGRectZero)
            label.text = items[index-1]
            label.textAlignment = .Center
            label.textColor = UIColor(white: 0.5, alpha: 1.0)
            self.addSubview(label)
            labels.append(label)
        }
    }
    
    func displayNewSelectedIndex() {
        var label = labels[selectedIndex]
        self.thumbview.frame =
    }

    
}
*/
