//
//  GrecPageViewController.swift
//  Ios h3
//
//  Created by Ingal Prudente Cornier on 23/11/2018.
//  Copyright © 2018 Ingal Prudente Cornier. All rights reserved.
//

import UIKit

class GrecPageViewController: UIViewController{
    
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
    
    
    @IBOutlet weak var like: UIButton!
    

    @IBAction func addToFav(_ sender: UIButton) {
        
        if favListArray.contains(self.grecs[0].id) {
            
            favListArray.remove(self.grecs[0].id)
            
        }else{
            
            favListArray.add(self.grecs[0].id)
        }
        
        print("AAAAAAAAAAAAAAAA")
//        print(self.grecTitle.text)
//        print(favListArray)
//        UserDefaults.standard.set(favListArray, forKey: "favList")

        UserDefaults.standard.set(favListArray, forKey: "favList")

        print(favListArray)
        print(UserDefaults.standard.object(forKey: "favList"))
        print(UserDefaults.standard.dictionaryRepresentation().keys)
    }
    
    var favListArray:NSMutableArray = []
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
            
            if UserDefaults.standard.object(forKey: "favList") != nil {

                self.favListArray = NSMutableArray.init(array: (UserDefaults.standard.object(forKey: "favList") as! NSArray).mutableCopy() as! NSMutableArray)
                
                print("BBBBBBBBB")
                print(self.favListArray)
                
            }
            if self.favListArray.contains(self.grecs[0].id) {
                
                self.like.setImage(UIImage(named: "logo_aygun2"), for: UIControl.State.normal)
                
            }else{
                
                self.like.setImage(UIImage(named: "heart-full"), for: UIControl.State.normal)
            }
            
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
