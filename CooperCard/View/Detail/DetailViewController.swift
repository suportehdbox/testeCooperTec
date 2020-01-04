//
//  DetailViewController.swift
//  CooperCard
//
//  Created by DEUS on 23/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    var username = ""
    var card_number = ""
    var limit = ""
    
    @IBOutlet weak var labelUsername: UILabel!
    
    
    
    @IBOutlet weak var labelCardNumber: UILabel!
    
    @IBOutlet weak var labelLimit: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        initControls()
       
    }
    
    func initControls(){
        
          let formatBR =  Formmatter()

           labelUsername.text = username
           labelCardNumber.text = card_number
           labelLimit.text = formatBR.formatBR(valor: limit)
           
           
          
        
    }
}
