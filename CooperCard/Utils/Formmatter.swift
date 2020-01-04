//
//  Formmatter.swift
//  CooperCard
//
//  Created by DEUS on 23/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation

class Formmatter {


    func formatBR(valor:String) -> String {
    
        let amount = Float(valor)
               
        

               let formatter = NumberFormatter()
                    formatter.locale = Locale(identifier: "pt_BR")
                    formatter.numberStyle = .currency
               let formattedTipAmount = formatter.string(from: amount as! NSNumber)

        
        return formatter.string(from: amount as! NSNumber)!
        
    }
    
   

}
