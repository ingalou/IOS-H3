//
//  FavouritesTableViewCell.swift
//  Ios h3
//
//  Created by julie Coustenoble on 26/11/2018.
//  Copyright © 2018 Ingal Prudente Cornier. All rights reserved.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var grecTitle: UILabel!
    
    @IBOutlet weak var grecPlace: UILabel!
    
    @IBOutlet weak var grecGrade: UILabel!
    
    
    @IBOutlet weak var grecArrow: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //colors
        let red = UIColor(displayP3Red: 238/255, green: 101/255, blue: 101/255, alpha: 1.0)
        let grey = UIColor(displayP3Red: 115/255, green: 115/255, blue: 115/255, alpha: 1.0)
        
        // Initialization code
        
        
        grecPlace.font = UIFont.systemFont(ofSize: 11)
        grecTitle.font = UIFont.boldSystemFont(ofSize: 14)
        grecPlace.textColor = grey
        
        
        grecGrade.textColor = red
        grecGrade.layer.borderWidth = 1
        grecGrade.layer.borderColor = red.cgColor
        grecGrade.frame.size.width = grecGrade.intrinsicContentSize.width + 10
        grecGrade.frame.size.height = grecGrade.frame.size.width
        grecGrade.textAlignment = .center
        grecGrade.layer.cornerRadius = grecGrade.frame.height/2
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        grecGrade.layer.cornerRadius = 100
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    
}
