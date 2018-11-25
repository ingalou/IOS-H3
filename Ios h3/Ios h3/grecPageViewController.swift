//
//  GrecPageViewController.swift
//  Ios h3
//
//  Created by Ingal Prudente Cornier on 23/11/2018.
//  Copyright © 2018 Ingal Prudente Cornier. All rights reserved.
//

import UIKit

class GrecPageViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var grecTitle: UILabel!
    @IBOutlet weak var moyenne: UILabel!
    @IBOutlet weak var adresse: UILabel!
    
    @IBOutlet weak var hygieneGrade: UILabel!
    
    @IBOutlet weak var viandeGrade: UILabel!
    
    @IBOutlet weak var fritesGrade: UILabel!
    
    @IBOutlet weak var sauceGrade: UILabel!
    
    @IBOutlet weak var cruditesGrade: UILabel!
    
    @IBOutlet weak var quantiteGrade: UILabel!
   
    @IBOutlet weak var qualitePrixGrade: UILabel!
    
    @IBOutlet weak var painGrade: UILabel!
    
    
    

    

    

    
    var id: Int = 0
    var grecs: [Grec] = [Grec]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("IDIDIDIDIDIIDDI\(id)")
        let fetchGrec = FetchGrec()
        fetchGrec.fetchId(id: id) { (grecsfromDB) in
            self.grecs = grecsfromDB
            print(self.grecs)
            self.grecTitle.text = self.grecs[0].title
            self.moyenne.text = String(format: "%0.1f", self.grecs[0].moyenne)
            self.adresse.text = self.grecs[0].address
            
        }
        
        
        
        let allGrades = [hygieneGrade, viandeGrade, fritesGrade, sauceGrade, cruditesGrade, quantiteGrade, qualitePrixGrade, painGrade]
        
        print(grecs)
        
        let red = UIColor(displayP3Red: 238/255, green: 101/255, blue: 101/255, alpha: 1.0)
        
        
        var i = 0
        while i < allGrades.count {
            allGrades[i]!.textColor = red
            allGrades[i]!.layer.borderWidth = 1
            allGrades[i]!.layer.borderColor = red.cgColor
            allGrades[i]!.frame.size.width = 24 + 10
            allGrades[i]!.frame.size.height = allGrades[i]!.frame.size.width
            allGrades[i]!.textAlignment = .center
            allGrades[i]!.layer.cornerRadius = allGrades[i]!.frame.height/2
            i = i + 1
            
            
        }
        
        
        
        
        

    
        
       
        
        
        // Do any additional setup after loading the view.
    }
    

}
