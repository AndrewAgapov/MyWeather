//
//  ViewController.swift
//  MyWeather
//
//  Created by Andrew on 12/10/15.
//  Copyright © 2015 AndrewAgapov. All rights reserved.
//

import UIKit
import CoreLocation



class ViewController: UIViewController, WeatherDataSourceDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var button: DrowingButton!
    @IBOutlet weak var lable: UILabel!
    
    let weather = WeatherDataSource()
    let locationManager = CLLocationManager()
    var city: String = ""
    var temp: Int = 0
    var main: String = ""
    var minTemp: Int = 0
    var maxTemp:Int = 0
 
    
    
        
    
    func setWeather(weather: WeatherStruct) {
        print(weather.temp)
        print(weather.city)
        temp = weather.temp
        main = weather.main
        city = weather.city
        minTemp = weather.minTemp
        maxTemp = weather.maxTemp
        performSegueWithIdentifier("showWeather", sender: nil)
        
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemakers, error) -> Void in
            
            if error != nil{
                print("error")
                return
            }
            
            if placemakers?.count > 0 {
                let pm = placemakers![0]
                self.displayLocationInfo(pm)
                
            }
        
        }
        
    }
    
    
    
    func displayLocationInfo(placemakers: CLPlacemark) {
        
        locationManager.stopUpdatingLocation()
        print(placemakers.locality)
        city = placemakers.locality! as String
        let coord = placemakers.location?.coordinate
        let latitude = coord!.latitude
        let longtitude = coord!.longitude
        print(latitude)
        print(longtitude)
        
        print(city)
        weather.gettingWeatherForCity(latitude, longtitude: longtitude)
        
        
    }
    
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
    
    @IBAction func buttonPressed(sender: AnyObject) {
        makingAnimation(button)
        makingAnimation(lable)
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makingAnimation(button)
        makingAnimation(lable)
       
        
        self.weather.delegate = self
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        
        
        
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destViewController = segue.destinationViewController as! WeatherViewController
        destViewController.temp = temp
        destViewController.main = main
        destViewController.city = city
        destViewController.maxTemp = maxTemp
        destViewController.minTemp = minTemp
    }
    
    
}

