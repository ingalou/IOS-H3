//
//  ClassementViewController.swift
//  Ios h3
//
//  Created by Ingal Prudente Cornier on 19/11/2018.
//  Copyright © 2018 Ingal Prudente Cornier. All rights reserved.
//

import UIKit


//heritage de Delegate et de dataSource
class RankingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
   
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    let sorters = ["moyenne", "addresse","nom","accueil","hygiène", "sauce", "viande", "frites", "pain", "crudités", "quantité", "qualité-prix",  "prix"]
    
//    a mettre dans l'action pour trier ( créer une fonction avec hygiene en param)
//    self.grecs = self.grecs.sorted(by: { $1.hygiene > $0.hygiene })
//    self.tableView.reloadData()
    
    var grecs: [Grec] = [Grec]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sorters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sorters[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(sorters[row])
        if( sorters[row] == "nom"){
        self.grecs = self.grecs.sorted(by: { $1.title > $0.title })
        }
        if( sorters[row] == "accueil"){
            self.grecs = self.grecs.sorted(by: { $1.hygiene > $0.hygiene })
        }
        if( sorters[row] == "hygiène"){
            self.grecs = self.grecs.sorted(by: { $1.moyenne > $0.moyenne })
        }
        if( sorters[row] == "addresse"){
            self.grecs = self.grecs.sorted(by: { $1.address > $0.address })
        }
        if( sorters[row] == "sauce"){
            self.grecs = self.grecs.sorted(by: { $1.sauce > $0.sauce })
        }
        if( sorters[row] == "viande"){
            self.grecs = self.grecs.sorted(by: { $1.viande > $0.viande })
        }
        if( sorters[row] == "frites"){
            self.grecs = self.grecs.sorted(by: { $1.frite > $0.frite })
        }
        if( sorters[row] == "pain"){
            self.grecs = self.grecs.sorted(by: { $1.pain > $0.pain })
        }
        if( sorters[row] == "crudités"){
            self.grecs = self.grecs.sorted(by: { $1.crudite > $0.crudite })
        }
        if( sorters[row] == "quantité"){
            self.grecs = self.grecs.sorted(by: { $1.quantite > $0.quantite })
        }
        if( sorters[row] == "qualité-prix"){
            self.grecs = self.grecs.sorted(by: { $1.qualitePrix > $0.qualitePrix })
        }
        if( sorters[row] == "prix"){
            self.grecs = self.grecs.sorted(by: { $1.prix > $0.prix })
        }
        self.tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        var screenWidth: CGFloat {
            return UIScreen.main.bounds.width
        }
        
        if let navigationBar = self.navigationController?.navigationBar {
            var firstFrame = CGRect(x: screenWidth - 50, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
//            let secondFrame = CGRect(x: navigationBar.frame.width/2, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
            
           
            let firstLabel = UILabel(frame: firstFrame)
            firstLabel.text = "?"
            
//            let secondLabel = UILabel(frame: secondFrame)
//            secondLabel.text = "Aygün"
            
            navigationBar.addSubview(firstLabel)
//            navigationBar.addSubview(secondLabel)
            
            firstLabel.textColor = UIColor.white
            
      
            
            
        }
        
        
        //on lui qu'on va les gérer ; self = this
        tableView.delegate = self
        tableView.dataSource = self
        
        let fetchGrec = FetchGrec()
        fetchGrec.fetch { (grecsfromDB) in
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
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let grecPageViewController = storyboard.instantiateViewController(withIdentifier: "GrecPageViewController") as! GrecPageViewController
        grecPageViewController.id = grecs[index.row].id
        
        navigationController?.pushViewController(grecPageViewController, animated: true)
    }
    
    
}

