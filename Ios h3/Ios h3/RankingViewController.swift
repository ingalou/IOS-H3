//
//  ClassementViewController.swift
//  Ios h3
//
//  Created by Ingal Prudente Cornier on 19/11/2018.
//  Copyright © 2018 Ingal Prudente Cornier. All rights reserved.
//

import UIKit


//heritage de Delegate et de dataSource
class RankingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
//    a mettre dans l'action pour trier ( créer une fonction avec hygiene en param)
//    self.grecs = self.grecs.sorted(by: { $1.hygiene > $0.hygiene })
//    self.tableView.reloadData()
    
    var grecs: [Grec] = [Grec]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //on lui qu'on va les gérer ; self = this
        tableView.delegate = self
        tableView.dataSource = self
        
        let fetchGrec = FetchGrec()
        fetchGrec.fetch { (grecsfromDB) in
            print(grecsfromDB)
            self.grecs = grecsfromDB
            self.tableView.reloadData()
            
        }
        
        
    }
    
    //nombre de lignes
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //le nombre d'éléments qu'il y a dans le tableau
        
        return grecs.count
    }
    
    //design de la ligne
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //optimise énormément car automatiquement il réutilise les cellules en mémoire ;
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "grecCell", for: indexPath) as! GrecTableViewCell
        //avec as! on change le type en forcastant car les labels sont MovieTableViewCell
        
        print("fuyqeufguygsudyfgsqduygqdsuyfgsuyguqiygf \(grecs)")
        cell.grecTitle.text = grecs[indexPath.row].title
        cell.grecPlace.text = grecs[indexPath.row].city
        cell.grecGrade.text = grecs[indexPath.row].moyenne.description
        
        cell.grecArrow.layer.cornerRadius = cell.grecArrow.frame.height/2
        cell.grecArrow.clipsToBounds = true
        cell.grecArrow.setTitleColor(UIColor.red, for: [])
        cell.grecArrow.layer.borderWidth = 1
        cell.grecArrow.layer.borderColor = UIColor.red.cgColor
        cell.grecArrow.frame.size.width = cell.grecArrow.intrinsicContentSize.width + 10
        cell.grecArrow.frame.size.height = cell.grecArrow.frame.size.width
        
        return cell
    }
    
    //hauteur de ligne
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt index: IndexPath) {
//        print("SELECT : \(index.row)")
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController")
//
//        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    
}

