//
//  ViewController.swift
//  Ios h3
//
//  Created by Ingal Prudente Cornier on 15/11/2018.
//  Copyright © 2018 Ingal Prudente Cornier. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class MapViewController: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        
        mapView.setRegion(region, animated: true)
        self.mapView.showsUserLocation = true
        
    }
    
    
}

