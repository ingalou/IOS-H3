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
        
       
        
        
        // Do any additional setup after loading the view.
    }
 

}
