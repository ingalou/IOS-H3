//
//  Grec.swift
//  Ios h3
//
//  Created by Ingal Prudente Cornier on 19/11/2018.
//  Copyright © 2018 Ingal Prudente Cornier. All rights reserved.
//

import UIKit

class Grec: NSObject {
    var title: String = ""
    var address: String = ""
    var city: String = ""
    var latitude: Double = 0
    var longitude: Double = 0
    var accueil: Int = 0
    var hygiene: Int = 0
    var sauce: Int = 0
    var viande: Int = 0
    var frite: Int = 0
    var pain: Int = 0
    var crudite: Int = 0
    var quantite: Int = 0
    var qualitePrix: Int = 0
    var moyenne: Int = 0
    var prix: Int = 0
    
    init(dico: [String : Any]  ) {
        
        self.title = dico["Nom"] as! String
        self.hygiene = dico["Hygiène"] as! Int
        self.latitude = dico["Latitude"] as! Double
        self.longitude = dico["Longitude"] as! Double
        
    }
}


