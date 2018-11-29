//
//  GrecPageViewController.swift
//  Ios h3
//
//  Created by Ingal Prudente Cornier on 23/11/2018.
//  Copyright © 2018 Ingal Prudente Cornier. All rights reserved.
//

import UIKit

class GrecPageViewController: UIViewController{
 
//outlet and action/////
    //labels
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
    
    //action
    @IBOutlet weak var like: UIButton!
    @IBAction func addToFav(_ sender: UIButton) {
        
        
        if favListArray.contains(self.grecs[0].id) {
            
            favListArray.remove(self.grecs[0].id)
            
        }else{

            favListArray.add(self.grecs[0].id)
        }
        if self.favListArray.contains(self.grecs[0].id) {
            
            self.like.setImage(UIImage(named: "heart-full"), for: UIControl.State.normal)
            
        }else{
            
            self.like.setImage(UIImage(named: "heart-empty"), for: UIControl.State.normal)
        }
        
        UserDefaults.standard.set(favListArray, forKey: "favList")

        print(favListArray)
        print(UserDefaults.standard.object(forKey: "favList"))
        print(UserDefaults.standard.dictionaryRepresentation().keys)
    }
///////////////
    
    var favListArray:NSMutableArray = []
    var id: Int = 0
    var grecs: [Grec] = [Grec]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Aygün"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        let fetchGrec = FetchGrec()
        fetchGrec.fetchId(id: id) { (grecsfromDB) in
            self.grecs = grecsfromDB
            print(self.grecs)
            self.grecTitle.text = self.grecs[0].title
            self.moyenne.text = String(format: "%0.1f", self.grecs[0].moyenne)
            self.adresse.text = self.grecs[0].address
            self.hygieneGrade.text = "\(self.grecs[0].hygiene)"
            self.viandeGrade.text = "\(self.grecs[0].viande)"
            self.fritesGrade.text = "\(self.grecs[0].frite)"
            self.sauceGrade.text = "\(self.grecs[0].sauce)"
            self.cruditesGrade.text = "\(self.grecs[0].crudite)"
            self.quantiteGrade.text = "\(self.grecs[0].quantite)"
            self.qualitePrixGrade.text = "\(self.grecs[0].qualitePrix)"
            self.painGrade.text = "\(self.grecs[0].pain)"
            
            if UserDefaults.standard.object(forKey: "favList") != nil {

                self.favListArray = NSMutableArray.init(array: (UserDefaults.standard.object(forKey: "favList") as! NSArray).mutableCopy() as! NSMutableArray)
            }
            if self.favListArray.contains(self.grecs[0].id) {
                
                self.like.setImage(UIImage(named: "heart-full"), for: UIControl.State.normal)
                
            }else{
                
                self.like.setImage(UIImage(named: "heart-empty"), for: UIControl.State.normal)
            }
            
        }
        // Do any additional setup after loading the view.
    }
}
