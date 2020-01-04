//
//  ViewController.swift
//  CooperCard
//
//  Created by Mac on 23/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDataSource,
UITableViewDelegate {

    let formatBR =  Formmatter()
    
    @IBOutlet weak var buttonAddCard: UIButton!
    
    
    @IBOutlet weak var table: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       Service.init()
    
        initControls()
      
        
        //apiClient()
       
    }
    
    
    

    
      func apiClient(){
               
        table.isHidden = true
               
               DispatchQueue.global(qos: .userInitiated).async {
               
               var urlConsome = "https://raw.githubusercontent.com/policante/Coopercard-mobile/master/service/cards.json"
               
             
                
                print(urlConsome)
               
               guard let url = URL(string:urlConsome ) else {return}
               
               let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                   guard let dataResponse = data,
                       error == nil else {
                           print(error?.localizedDescription ?? "Response Error")
                           return }
                   
                   
                   do {
                       
                       let json = try? JSONDecoder().decode(Cards.self, from: dataResponse)

                       
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
                            
                        self.table.isHidden = false
                        self.table.reloadData()
                           
                       }
                       
                   }
               }
               task.resume()
                   
                   
               }
               
               
           }
           
           
           
    
    
    func initControls(){
        navigationController?.navigationBar.barTintColor = UIColor.init(hexString: "#2eb24e")
              
           //   self.view.backgroundColor = UIColor(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0, alpha: 1.0)
        buttonAddCard.backgroundColor = .clear
        buttonAddCard.layer.cornerRadius = 5
        buttonAddCard.layer.borderWidth = 1
        buttonAddCard.layer.borderColor = UIColor.gray.cgColor
        
        
        self.view.backgroundColor = UIColor.init(hexString: "#fcf4f4")
        
        
             
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return (DataSource.dataSourceCode.count)
                  
   }
   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 154
    }

  
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellHomeTableViewCell") as! cellHomeTableViewCell;
                  
        cell.labelName.text =  DataSource.dataSourceCode[indexPath.row][0]
        cell.labelCardNumber.text =  "**** " + DataSource.dataSourceCode[indexPath.row][1]
    
        cell.labelLimit.text = formatBR.formatBR(valor: DataSource.dataSourceCode[indexPath.row][2])
    
        cell.viewBackGround.backgroundColor = UIColor.init(hexString: DataSource.dataSourceCode[indexPath.row][4])
    
        
    
    
    
    
    
    print(DataSource.dataSourceCode[indexPath.row][5])
    
    
    
    
    
    
    
    
    let url = URL(string:(DataSource.dataSourceCode[indexPath.row][5]))
    
    
    
    //print(url)
   
    
        let data = try? Data(contentsOf: url!)
        //let image: UIImage = UIImage(data: data!)!
              
        //cell.imageFlag.image = image
    
   
    return cell
    
   }
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
           
            let row = indexPath.row
       
            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            let controller = storyboard.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController

            controller.username = DataSource.dataSourceCode[row][0]
            controller.card_number = DataSource.dataSourceCode[row][1]
            controller.limit = DataSource.dataSourceCode[row][2]
        
            self.navigationController?.pushViewController(controller, animated: true)

       }
    
  
}
