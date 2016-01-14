//
//  WeatherDataSource.swift
//  MyWeather
//
//  Created by Andrew on 12/10/15.
//  Copyright © 2015 AndrewAgapov. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
protocol WeatherDataSourceDelegate{
    func setWeather(weather: WeatherStruct)
}

class WeatherDataSource {
    
    var json: JSON = []
    var delegate: WeatherDataSourceDelegate?
    
    
    func gettingWeatherForCity (lantitude:Double, longtitude:Double)  {
        
        
        
        let url  = "http://api.openweathermap.org/data/2.5/weather?lat=\(lantitude)&lon=\(longtitude)&units=metric&appid=0c48b8a28ec5fe8e4e578edc2678d8b9"
        
        
        Alamofire.request(.GET, url).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    self.json = JSON(value)
                    let temperature = JSON(value)["main"]["temp"].int
                    let city = JSON(value)["name"].string
                    let main = JSON(value)["weather"][0]["main"].string
                    let maxTemp = JSON(value)["main"]["temp_max"].int
                    let minTemp = JSON(value)["main"]["temp_min"].int
                    print(JSON(value))
                    if JSON(value) != nil{
                        let weather = WeatherStruct(temp: temperature!, maxTemp: maxTemp!, minTemp: minTemp!, city: city!, main: main!)
                        
                        
                        if self.delegate != nil {
                            
                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                self.delegate?.setWeather(weather)
                            })
                        }
                        
                    }
                }
            case .Failure(let error):
                print(error)
            }
            
            
            
            
            
        }
        
        
        
    }
    
    
    
    
}
