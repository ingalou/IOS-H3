//
//  Grec.swift
//  Ios h3
//
//  Created by Ingal Prudente Cornier on 19/11/2018.
//  Copyright © 2018 Ingal Prudente Cornier. All rights reserved.
//

import UIKit

class Grec: NSObject {
    var id: Int = 0
    var title: String = ""
    var address: String = ""
    var city: String = ""
    var latitude: Double = 0
    var longitude: Double = 0
    var accueil: String = ""
    var hygiene: Int = 0
    var sauce: Int = 0
    var viande: Int = 0
    var frite: Int = 0
    var pain: Int = 0
    var crudite: Int = 0
    var quantite: Int = 0
    var qualitePrix: Int = 0
    var moyenne: Double = 0
    var prix: Int = 0
    
    init(dico: [String : Any]  ) {
        if let id = dico["ID"] as? Int {
            self.id = id
        }
        if let title = dico["Nom"] as? String {
            self.title = title
        }
        if let hygiene = dico["Hygiene"] as? Int {
            self.hygiene = hygiene
        }
        if let latitude = dico["Latitude"] as? Double {
            self.latitude = latitude
        }
        if let longitude = dico["Longitude"] as? Double {
            self.longitude = longitude
        }
        if let accueil = dico["Acceuil"] as? String {
            self.accueil = accueil
        }
        if let address = dico["Adresse"] as? String {
            self.address = address
        }
        if let city = dico["Ville"] as? String {
            self.city = city
        }
        if let sauce = dico["Sauces"] as? Int {
            self.sauce = sauce
        }
        if let viande = dico["Viandes"] as? Int {
            self.viande = viande
        }
        if let frite = dico["Frites"] as? Int {
            self.frite = frite
        }
        if let pain = dico["Pain"] as? Int {
            self.pain = pain
        }
        if let crudite = dico["crudite"] as? Int {
            self.crudite = crudite
        }
        if let quantite = dico["Quantite"] as? Int {
            self.quantite = quantite
        }
        if let qualitePrix = dico["Qualite-prix"] as? Int {
            self.qualitePrix = qualitePrix
        }
        if let moyenne = dico["Moyenne"] as? Double {
            self.moyenne = moyenne
        }
        if let prix = dico["Prix"] as? Int {
            self.prix = prix
        }
        
    }
}
