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
import Firebase

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    let manager = CLLocationManager()
    var grecs: [Grec] = [Grec]()
    
    
    override func viewDidLoad() {
        
        
        let fetchGrec = FetchGrec()
        fetchGrec.fetch { (grecsfromDB) in
            print(grecsfromDB)
            self.grecs = grecsfromDB
            for grec in self.grecs{
                print(grec.title)
                let grecCoord = CLLocationCoordinate2D(latitude: grec.latitude, longitude: grec.longitude)
                let grecAnnotation = GrecAnnotation(coordinate: grecCoord, title: grec.title, moyenne: grec.moyenne, id: grec.id)
                self.mapView.addAnnotation((grecAnnotation))
                
            }
        }
        
        super.viewDidLoad()
        
        mapView.delegate = self
        
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
    
    func mapView(_ mapView:MKMapView, viewFor annotation: MKAnnotation)-> MKAnnotationView? {
        
        if let _ = annotation as? MKUserLocation {
            
        } else {
            
            let grecAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as! MKMarkerAnnotationView
            
            grecAnnotationView.animatesWhenAdded = true
            grecAnnotationView.titleVisibility = .adaptive
            grecAnnotationView.canShowCallout = true
            grecAnnotationView.isEnabled = true
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            button.setImage(UIImage(named: "arrow"), for: .normal)
            
            
            
            if let grecAnnotation = annotation as? GrecAnnotation{
                
                let moyenne = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
                moyenne.textColor = UIColor(displayP3Red: 238/255, green: 101/255, blue: 101/255, alpha: 1.0)
                moyenne.font = UIFont.systemFont(ofSize: 20)
                if let realMoyenne = grecAnnotation.moyenne {
                    moyenne.text = String(format: "%0.1f", realMoyenne)
                }
                
                grecAnnotationView.leftCalloutAccessoryView = moyenne
            }
            
            
            grecAnnotationView.rightCalloutAccessoryView = button
            
            
            //
            //
            //            //PUSH
            //            navigationController?.pushViewController(detailViewController, animated: true)
            
            
            return grecAnnotationView
            
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        
        if let grecAnnotation = view.annotation as? GrecAnnotation{
            if let id = grecAnnotation.id {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let grecPageViewController = storyboard.instantiateViewController(withIdentifier: "GrecPageViewController") as! GrecPageViewController
                grecPageViewController.id = id
                
                navigationController?.pushViewController(grecPageViewController, animated: true)
                
            }
            
        }
        
    }
}
