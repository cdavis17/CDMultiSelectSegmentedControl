//
//  ViewController.swift
//  CDMultiSelectSegmentedControl
//
//  Created by Christopher Davis on 2/29/16.
//  Copyright © 2016 D2 Business Alliance, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Oh Shit
    @IBOutlet weak var segmentedControl: CDMultiSelectSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        segmentedControl.items = ["Test 1", "Test 2", "Test 3"]
        segmentedControl.font = UIFont(name: "Georgia", size: 12)
        segmentedControl.borderColor = UIColor.redColor()
        segmentedControl.borderWidth = 1
        segmentedControl.backgroundColor = UIColor.redColor()
        segmentedControl.selectedIndicies = [0,1,2]
        segmentedControl.addTarget(self, action: "segmentValueChanged", forControlEvents: .ValueChanged)
    }
    
    func segmentValueChanged() {
        // Prints value of selected items
        for(var i = 0; i < segmentedControl.selectedIndicies.count; i++) {
            print(segmentedControl.items[segmentedControl.selectedIndicies[i]])
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

