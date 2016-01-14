//
//  DrowingButton.swift
//  MyWeather
//
//  Created by Andrew on 12/12/15.
//  Copyright © 2015 AndrewAgapov. All rights reserved.
//

import UIKit

class DrowingButton: UIButton {

    override func drawRect(rect: CGRect) {
        let path = UIBezierPath(ovalInRect: rect)
        UIColor.whiteColor().setFill()
        path.fill()
        
        
        
        
    }
    

}
