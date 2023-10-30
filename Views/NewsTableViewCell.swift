//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by beyza nur on 28.10.2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var tittleLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
