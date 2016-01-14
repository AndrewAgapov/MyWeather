//
//  WeatherStruct.swift
//  MyWeather
//
//  Created by Andrew on 12/10/15.
//  Copyright © 2015 AndrewAgapov. All rights reserved.
//

import Foundation

struct WeatherStruct {
    
    let temp: Int
    
    let city: String
    
    let main: String
    
    let maxTemp: Int
    
    let minTemp: Int
    
    init (temp:Int,maxTemp:Int, minTemp:Int, city:String, main:String) {
        
        self.temp = temp
        self.city = city
        self.main = main
        self.maxTemp = maxTemp
        self.minTemp = minTemp
    }
    
}