//
//  MainTableCustomViewCell.swift
//  MoviesApp
//
//  Created by Andres Leal on 4/29/21.
//  Copyright © 2021 Andres Leal. All rights reserved.
//

import UIKit

class MainTableCustomViewCell: UITableViewCell {
    
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblTitleMovie: UILabel!
    @IBOutlet weak var lblDescriptionMovie: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
