//
//  HomeTableViewCell.swift
//  CooperCard
//
//  Created by Mac on 23/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class cellHomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelCardNumber: UILabel!
    
    
    @IBOutlet weak var labelLimit: UILabel!
    
    
    @IBOutlet weak var imageFlag: UIImageView!
    
    
    @IBOutlet weak var viewBackGround: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
