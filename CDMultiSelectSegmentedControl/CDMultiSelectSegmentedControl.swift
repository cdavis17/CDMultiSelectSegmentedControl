//
//  CDMultiSelectSegmentedControl.swift
//  CDMultiSelectSegmentedControl
//  Custom Control to Allow Multiple Selection
//  When Using a SegmentedControl
//
//
//  Copyright (c) <2016> <Christopher Davis>
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associate
//  documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
//  persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
//  Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//  WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
//  OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


import UIKit
import QuartzCore

// MARK: CDMultiSelectSegmentedControl
@IBDesignable class CDMultiSelectSegmentedControl: UIControl {

    
    private var labels = [UILabel]()

    
    // Creates 3 Items
    var items: [String] = ["Option 1", "Option 2", "Option 3"] {
        didSet {
            setupLabels()
        }
    }
    
    // Sets All Items Selected
    var selectedIndicies : [Int] = [0, 1, 2] {
        didSet {
            displaySelectedIndicies()
        }
    }

    // Selected Label
    @IBInspectable var selectedLabelColor : UIColor = UIColor.whiteColor() {
        didSet {
            setSelectedColors()
        }
    }
    
    // Unselected Label
    @IBInspectable var unselectedLabelColor : UIColor = UIColor.blueColor() {
        didSet {
            setSelectedColors()
            
        }
    }
    
    // Selected Background Color
    @IBInspectable var selectedBackgroundColor : UIColor = UIColor.blueColor() {
        didSet {
            setSelectedColors()
            
        }
    }
    // Unselcted Background COlor
    @IBInspectable var unselectedBackgroundColor : UIColor = UIColor.whiteColor() {
        didSet {
            setSelectedColors()
           
        }
    }
    
    // Segmented Border
    @IBInspectable var borderColor : UIColor = UIColor.whiteColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 1 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    // Font
    @IBInspectable var font : UIFont! = UIFont.systemFontOfSize(12) {
        didSet {
            setFont()
        }
    }
    
    // Required
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // Setup View
        setupView()
    }
    
    // Override
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Setup View
        setupView()
    }
    
    // Determines if location was a label, add/remove to/from selectedIndicies
    override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        // Touch
        let location = touch.locationInView(self)
        
        // Selected Index
        var selected = -1
        for(var i = 0; i < labels.count; i++){
            if (labels[i].frame.contains(location)){
                selected = i
            }
        }
        
        // Remove Or Add Selected Index to List
        if let i = selectedIndicies.indexOf(selected){
            selectedIndicies.removeAtIndex(i)
        } else {
            selectedIndicies.append(selected)
        }
        
        // Updates Coloring for UI
        updateSelections()
 
        return true
    }
   
    
    // Update Selections
    func updateSelections(){
        
        // Update Label Colors
        for(var i = 0; i < labels.count; i++){
            if(selectedIndicies.contains(i)) {
                labels[i].textColor = selectedLabelColor
                labels[i].backgroundColor = selectedBackgroundColor
            } else {
                labels[i].textColor = unselectedLabelColor
                labels[i].backgroundColor = unselectedBackgroundColor
            }
        }
        // Target
        sendActionsForControlEvents(.ValueChanged)
    }
   
    
    

    func setupView(){
        // Setup
        setupLabels()
        
    }
    
    func setupLabels(){
        // Remove
        for label in labels {
            label.removeFromSuperview()
        }
        
        // Make Sure to Keep Size
        labels.removeAll(keepCapacity: true)
        
        // Add to view
        for index in 1...items.count {
            
            let label = UILabel(frame: CGRectMake(0, 0, 70, 40))
            label.text = items[index - 1]
            label.backgroundColor = UIColor.clearColor()
            label.textAlignment = .Center
            label.font = UIFont(name: "Avenir-Black", size: 12)
            label.textColor = index == 1 ? selectedLabelColor : unselectedLabelColor
            label.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(label)
            labels.append(label)
        }
        // Constraints
        addItemConstraints(labels, mainView: self, padding: borderWidth)
    }
    
    
    func  displaySelectedIndicies() {
        
            // Set correct colors
            setSelectedColors()

            // Update Display
            self.setNeedsDisplay()
    }


    
    func addItemConstraints(items: [UIView], mainView: UIView, padding: CGFloat) {
        
        for (index, button) in items.enumerate() {
            // Centered Vertically In Container
            let top = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: mainView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
            
            let bottom = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: mainView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0)
            
            var right : NSLayoutConstraint!
            // Last Element in Container
            if index == items.count - 1 {
                right = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: mainView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -padding)
            } else {
                let nextButton = items[index+1]
                right = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: nextButton, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: -padding)
            }
            
            
            var left : NSLayoutConstraint!
            // First Element in Container
            if index == 0 {
                left = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: mainView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: padding)
            } else {
                let prevButton = items[index-1]
                left = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: prevButton, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: padding)
                
                let firstItem = items[0]
                
                let width = NSLayoutConstraint(item: button, attribute: .Width, relatedBy: NSLayoutRelation.Equal, toItem: firstItem, attribute: .Width, multiplier: 1.0  , constant: 0)
                
                mainView.addConstraint(width)
            }
            
            mainView.addConstraints([top, bottom, right, left])
        }
    }
    
    // Set All Items to Selected
    func setSelectedColors(){
        for item in labels {
            item.textColor = selectedLabelColor
            item.backgroundColor = selectedBackgroundColor
        }
    
    }
    
    func setFont(){
        for item in labels {
            item.font = font
        }
    }
    
}

