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
    
    //pickerView text
    let sorters = ["nom", "moyenne", "addresse","accueil","hygiène", "sauce", "viande", "frites", "pain", "crudités", "quantité", "qualité-prix"]
    
    var grecs: [Grec] = [Grec]()
    
    
//picker view
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
        let fetchGrec = FetchGrec()
        fetchGrec.fetch { (grecsfromDB) in
            self.grecs = grecsfromDB
            if( self.sorters[row] == "nom"){
                self.grecs = self.grecs.sorted(by: { $1.title > $0.title })
            }
            if( self.sorters[row] == "hygiene"){
                self.grecs = self.grecs.sorted(by: { $1.hygiene > $0.hygiene })
            }
            if( self.sorters[row] == "moyenne"){
                self.grecs = self.grecs.sorted(by: { $1.moyenne < $0.moyenne })
            }
            if( self.sorters[row] == "addresse"){
                self.grecs = self.grecs.sorted(by: { $1.address > $0.address })
            }
            if( self.sorters[row] == "sauce"){
                self.grecs = self.grecs.sorted(by: { $1.sauce < $0.sauce })
            }
            if( self.sorters[row] == "viande"){
                self.grecs = self.grecs.sorted(by: { $1.viande < $0.viande })
            }
            if( self.sorters[row] == "frites"){
                self.grecs = self.grecs.sorted(by: { $1.frite < $0.frite })
            }
            if( self.sorters[row] == "pain"){
                self.grecs = self.grecs.sorted(by: { $1.pain < $0.pain })
            }
            if( self.sorters[row] == "crudités"){
                self.grecs = self.grecs.sorted(by: { $1.crudite < $0.crudite })
            }
            if( self.sorters[row] == "quantité"){
                self.grecs = self.grecs.sorted(by: { $1.quantite < $0.quantite })
            }
            if( self.sorters[row] == "qualité-prix"){
                self.grecs = self.grecs.sorted(by: { $1.qualitePrix < $0.qualitePrix })
            }
            if( self.sorters[row] == "accueil"){
                self.grecs = self.grecs.sorted(by: { $1.accueil < $0.accueil })
            }
            self.tableView.reloadData()
        }
        
     
    }
/////////////////////////////
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Classement"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        
        
        
        pickerView.delegate = self
        pickerView.dataSource = self

        
        
        //on lui qu'on va les gérer ; self = this
        tableView.delegate = self
        tableView.dataSource = self
        
        let fetchGrec = FetchGrec()
        fetchGrec.fetch { (grecsfromDB) in
            self.grecs = grecsfromDB
            self.grecs = self.grecs.sorted(by: { $1.title > $0.title })
            self.tableView.reloadData()
            
            
            
            
        }
    }

//table view
    //nombre de lignes
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //le nombre d'éléments qu'il y a dans le tableau
        return grecs.count
    }
    
    //design de la ligne
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "grecCell", for: indexPath) as! GrecTableViewCell
        
        cell.grecTitle.text = grecs[indexPath.row].title
        cell.grecPlace.text = grecs[indexPath.row].city
        cell.grecGrade.text =  String(format: "%0.1f", grecs[indexPath.row].moyenne)
       
        
        //circle around arrow
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
/////////////
}

