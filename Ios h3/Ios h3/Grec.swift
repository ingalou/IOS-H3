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
    
    init(dico: [String : Any]  ) {
        
        self.title = dico["Nom"] as! String
        print("AAAAAAAAAAAAAAAA \(self.title)")
        
    }
}
