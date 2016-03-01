# CDMultiSelectSegmentedControl
##### Custom Segmented Control to Allow Multiple Selections in Swift

## Introduction
A Segmented Control in Swift only allows for one selection, and after being unable to find any controls already created, I decided to create one on my own.  This is my first custom control I've created to share, and I know it may not be perfect.  Any input or changes would be appreciated.

## Installation
As of now, the best way to use the control is to copy the CDMultiSelectSegmentedControl.swift file into your project.  From there, create a new view in your storyboard, and provide the class as CDMultiSelectSegmentedControl, and add an outlet to your view controller.  Inside the view controller, you should do some of the following
  ```
  segmentedControl.items = ["Test 1", "Test 2", "Test 3"] // Creates the items
  segmentedControl.font = UIFont(name: "Georgia", size: 12) // Sets the font
  segmentedControl.borderColor = UIColor.redColor() // Outside border color
  segmentedControl.borderWidth = 1 // Thickness of border -> No border if set to 0
  segmentedControl.backgroundColor = UIColor.redColor() // Background color, visible in between cells if padding isn't 0
  segmentedControl.selectedIndicies = [0,1,2] // Indicies to show highlighted
  segmentedControl.addTarget(self, action: "segmentValueChanged", forControlEvents: .ValueChanged) // When any object is clicked
  ```

## Images
![alt tag](https://github.com/cdavis17/CDMultiSelectSegmentedControl/blob/master/SegmentedControlAllSelected.png)
![alt tag](https://github.com/cdavis17/CDMultiSelectSegmentedControl/blob/master/SegmentedControlNoneSelected.png)
![alt tag](https://github.com/cdavis17/CDMultiSelectSegmentedControl/blob/master/SegmentedControl2Selected.png)

## Future Work
I know this control is far from perfect, and I have a few other things I intend on implementing in the near future.  Square borders are boring, so I'll be updating with rounded corners.  Anyone else with other ideas is free to contribute.

## License 
Copyright (c) 2016 Christopher Davis

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associate
documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
