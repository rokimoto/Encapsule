//
//  baeListTableViewCell.swift
//  Encapsule
//
//  Created by Chow, Stephanie on 5/30/16.
//  Copyright © 2016 Rachel Okimoto. All rights reserved.
//

import UIKit

class baeListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var mainDescriptionLabel: UILabel!
    
    @IBOutlet weak var baeProfilePicture: UIImageView!
    
    @IBAction func selectButtonDidPress(sender: UIButton) {
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
