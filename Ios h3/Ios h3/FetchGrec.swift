//
//  fetchGrec.swift
//  Ios h3
//
//  Created by Ingal Prudente Cornier on 19/11/2018.
//  Copyright © 2018 Ingal Prudente Cornier. All rights reserved.
//

import UIKit
import Firebase

class FetchGrec: NSObject {
    
    func fetch(completionHandler: @escaping ([Grec])->Void ){
        FirebaseApp.configure()
        let db = Firestore.firestore()
        var grecs: [Grec] = [Grec]()
        
        db.collection("kebabs").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
               
                for document in querySnapshot!.documents {
                    print(" thomas \(document.documentID) => \(document.data())")
                    var dictio = document.data()
                    print(dictio)
                    print(document.data()["Nom"])
                    let grec = Grec(dico: dictio)
                    print("ingal \(grec)")
                    grecs.append(grec)
                    
                    
                }
                
            }
            
            completionHandler(grecs)
            
        }
        
        
            }
        }

