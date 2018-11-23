//
//  GrecAnnotation.swift
//  Ios h3
//
//  Created by Ingal Prudente Cornier on 22/11/2018.
//  Copyright © 2018 Ingal Prudente Cornier. All rights reserved.
//

import UIKit
import MapKit

final class GrecAnnotation: NSObject,  MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var moyenne: Int?
    
    init(coordinate:CLLocationCoordinate2D, title:String? ,moyenne: Int?){
        self.coordinate = coordinate
        self.title = title
        self.moyenne = moyenne
        
        super.init()
    }
}
