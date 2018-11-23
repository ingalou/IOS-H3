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
        let db = Firestore.firestore()
        var grecs: [Grec] = [Grec]()
        
        
        db.collection("kebabs").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let dictio = document.data()
                    let grec = Grec(dico: dictio)
                    grecs.append(grec)
                    
                }
            }
            completionHandler(grecs)
            print(grecs.count)
        }
    }
    
}

