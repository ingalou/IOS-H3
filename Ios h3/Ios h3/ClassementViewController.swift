//
//  ClassementViewController.swift
//  Ios h3
//
//  Created by Ingal Prudente Cornier on 19/11/2018.
//  Copyright © 2018 Ingal Prudente Cornier. All rights reserved.
//

import UIKit


class RankingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var movies: [String] = ["Movie1", "Movie2", "Movie3", "Movie4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //on lui qu'on va les gérer ; self = this
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    //nombre de lignes
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //le nombre d'éléments qu'il y a dans le tableau
        return movies.count
    }
    
    //design de la ligne
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //optimise énormément car automatiquement il réutilise les cellules en mémoire ;
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        //avec as! on change le type en forcastant car les labels sont MovieTableViewCell
        
        
        
        cell.titleLabel.text = movies[indexPath.row]
        cell.dateLabel.text = "DATE : "
        
        
        return cell
    }
    
    //hauteur de ligne
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt index: IndexPath) {
        print("SELECT : \(index.row)")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController")
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    
}
