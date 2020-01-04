//
//  Service.swift
//  CooperCard
//
//  Created by Mac on 23/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class Service {

    init() {
 
        consomeFile()
        //consomeJSON()
        //apiClient()
    }
    
    
    
      func apiClient(){
               
               
               DispatchQueue.global(qos: .userInitiated).async {
                   
               var urlConsome = "https://raw.githubusercontent.com/policante/Coopercard-mobile/master/service/cards.json"
               
               //print(urlConsome)
               
               guard let url = URL(string:urlConsome ) else {return}
               
               let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                   guard let dataResponse = data,
                       error == nil else {
                           print(error?.localizedDescription ?? "Response Error")
                           return }
                   
                   
                   do {
                       
                       let json = try? JSONDecoder().decode(Cards.self, from: dataResponse)

                 

                       //print(json)
                     
                       
                       let counter = json!.cards.count
                                        
                                        DataSource.dataSourceCode.removeAll()
                                        
                                        

                                        
                                        for i in 0..<counter {

                                            var row = [String]()
                                            
                                            row.append(json!.cards[i].name)
                                            row.append(json!.cards[i].cardNumber)
                                            row.append(String(json!.cards[i].limit))
                                            row.append(json!.cards[i].category.type)
                                            row.append(json!.cards[i].category.backgroundColor)
                                            row.append(json!.cards[i].category.imagePath)
                                           
                                            
                                            DataSource.dataSourceCode.append(row)
                                            
                                        }
                                        
                                        
                      
                       DispatchQueue.main.async {
                           
                      
                       }
                       
                   }
               }
               task.resume()
                   
                   
               }
               
               
           }
           
           
           
    
    
    
    func consomeFile(){
        
        do {
                   if let file = Bundle.main.url(forResource: "cards", withExtension: "json") {
                       let data = try Data(contentsOf: file)

                       let json = try? JSONDecoder().decode(Cards.self, from: data)
         
                       let counter = json!.cards.count
                       
                       DataSource.dataSourceCode.removeAll()
                       
                       

                       
                       for i in 0..<counter {

                           var row = [String]()
                           
                           row.append(json!.cards[i].name)
                           row.append(json!.cards[i].cardNumber)
                           row.append(String(json!.cards[i].limit))
                           row.append(json!.cards[i].category.type)
                           row.append(json!.cards[i].category.backgroundColor)
                           row.append(json!.cards[i].category.imagePath)
                          
                           
                           DataSource.dataSourceCode.append(row)
                           
                       }
                       
                       
                     
                   } else {
                       print("no file")
                   }
               } catch {
                   print(error.localizedDescription)
               }
           
               
               
             
           }
    }


