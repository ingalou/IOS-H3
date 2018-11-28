//
//  FavouritesViewController.swift
//  Ios h3
//
//  Created by Bastien Lheureux on 27/11/2018.
//  Copyright © 2018 Ingal Prudente Cornier. All rights reserved.
//

import UIKit

class FavouritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var favListArray:NSMutableArray = []
    
    var grecs: [Grec] = [Grec]()
    

    override func viewWillAppear(_ animated: Bool) {
        print("viewwillappear")
        
        super.viewWillAppear(animated)
        let fetchGrec = FetchGrec()
        fetchGrec.fetchFav { (grecsfromDB) in
            self.grecs = grecsfromDB
            if UserDefaults.standard.object(forKey: "favList") != nil {
                
                self.favListArray = NSMutableArray.init(array: (UserDefaults.standard.object(forKey: "favList") as! NSArray).mutableCopy() as! NSMutableArray)
                
                print("BBBBBBBBB")
                print(self.favListArray)
                 self.tableView.reloadData()
                
            }
           

            
        }
        
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
       
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteCell", for: indexPath) as! FavouriteTableViewCell
        print("CCCCC")
        print(favListArray[indexPath.row] as! Int)
        print(grecs[favListArray[indexPath.row] as! Int].title)
        print("AAPAPAP")
        print(grecs[94].title)
        
        cell.grecTitle.text = grecs[favListArray[indexPath.row] as! Int - 1].title
        cell.grecPlace.text = grecs[favListArray[indexPath.row]as! Int - 1].city
        cell.grecGrade.text = grecs[favListArray[indexPath.row]as! Int - 1].moyenne.description
        cell.grecArrow.layer.cornerRadius = cell.grecArrow.frame.height/2
        cell.grecArrow.clipsToBounds = true
        cell.grecArrow.setTitleColor(UIColor.red, for: [])
        cell.grecArrow.layer.borderWidth = 1
        cell.grecArrow.layer.borderColor = UIColor.red.cgColor
        cell.grecArrow.frame.size.width = cell.grecArrow.intrinsicContentSize.width + 10
        cell.grecArrow.frame.size.height = cell.grecArrow.frame.size.width
    
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt index: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let grecPageViewController = storyboard.instantiateViewController(withIdentifier: "GrecPageViewController") as! GrecPageViewController
        grecPageViewController.id = grecs[favListArray[index.row] as! Int - 1].id
        
        navigationController?.pushViewController(grecPageViewController, animated: true)
    }
    
    
}
