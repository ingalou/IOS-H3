//
//  grecPageViewController.swift
//  Ios h3
//
//  Created by Ingal Prudente Cornier on 21/11/2018.
//  Copyright © 2018 Ingal Prudente Cornier. All rights reserved.
//

import UIKit

class grecPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
   
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "gradeCell", for: indexPath) as! GradeTableViewCell
        //avec as! on change le type en forcastant car les labels sont MovieTableViewCell
        
        
        
        
        
        return cell
    }
    
    
    @IBOutlet weak var grecTitle: UILabel!
    @IBOutlet weak var grecPlace: UILabel!
    @IBOutlet weak var grecGrade: UILabel!
    @IBOutlet weak var grecText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let red = UIColor(displayP3Red: 238/255, green: 101/255, blue: 101/255, alpha: 1.0)
        let grey = UIColor(displayP3Red: 115/255, green: 115/255, blue: 115/255, alpha: 1.0)
        
        
        grecTitle.font = UIFont.boldSystemFont(ofSize: 34.0)
        grecTitle.font = UIFont.systemFont(ofSize: 24)
        
        grecPlace.font = UIFont.systemFont(ofSize: 11)
        grecPlace.textColor = grey
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
