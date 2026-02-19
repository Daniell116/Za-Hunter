//
//  LocationManager.swift
//  Za Hunter
//
//  Created by daniell Escareno on 2/10/26.
//
import Foundation
import CoreLocation

@Observable 
class LocationManager: NSObject, CLLocationManagerDelegate {
var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
            
        }
    }
