//
//  WeatherViewController.swift
//  MyWeather
//
//  Created by Andrew on 12/12/15.
//  Copyright © 2015 AndrewAgapov. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var labelTemp: UILabel!
    @IBOutlet weak var imageOfWeather: UIImageView!
    
    @IBOutlet weak var cityLable: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    @IBOutlet weak var locationMarkOutlet: UIImageView!
    let currentDateTime = NSDate()
    var temp = Int()
    var main = String()
    var city = String()
    var minTemp: Int = 0
    var maxTemp:Int = 0
    
    func makingAnimation(with: UIView) {
        with.transform = CGAffineTransformMakeScale(0.6, 0.6)
        
        UIView.animateWithDuration(2.0,
            delay: 0,
            usingSpringWithDamping: CGFloat(0.20),
            initialSpringVelocity: CGFloat(6.0),
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                with.transform = CGAffineTransformIdentity
            },
            completion: { Void in()  }
        )
        
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH"
        let someDateTime = formatter.stringFromDate(currentDateTime)
        makingAnimation(locationMarkOutlet)
        print("temp in WeatherView\(temp)")
        print("main is\(main)")
        print(someDateTime)
        
        labelTemp.text = String(temp) + "\u{00B0}C"
        cityLable.text = city
        maxTempLabel.text = String(maxTemp) + "\u{00B0}C"
        minTempLabel.text = String(minTemp) + "\u{00B0}C"
        if Int(someDateTime) >= 19 {
            imageOfWeather.image = UIImage.init(named: main + "Night.png")
        }
        else{
        imageOfWeather.image = UIImage.init(named: main + ".png")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
