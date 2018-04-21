//
//  Lotto Max View Controller.swift
//  LottoTime
//
//  Created by Shanthosh Pushparajah on 2018-04-20.
//  Copyright © 2018 Shanthosh Pushparajah. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class LottoMaxViewController: UIViewController {
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //TODO: API and Variables
    
    let futureURL = "https://www.magayo.com/api/jackpot.php?api_key=fuPBjPF9sGzrLYnrFa&game=ca_lotto_max"
    
    let pastURL = "https://www.magayo.com/api/results.php?api_key=fuPBjPF9sGzrLYnrFa&game=ca_lotto_max"
    
    var jackpot = "jackpot"
    var futureDraw = "next_draw"
    var draw = "draw"
    var results = "results"
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //TODO: Setup IBOutlets

    @IBOutlet weak var MaxPrice: UILabel!
    @IBOutlet weak var drawDate: UILabel!
    @IBOutlet weak var lastDraw: UILabel!
    @IBOutlet weak var winners: UILabel!
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //TODO: Overide
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        getFutureData(url: futureURL)
        getPastData(url: pastURL)
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //TODO: Networking
    
    //Get Jackpot and next draw value
    
    func getFutureData (url: String) {
        
        Alamofire.request(url, method: .get).responseJSON { response in
            if response.result.isSuccess {
                
                print("Sucess! Got data")
                
                let futureJSON : JSON = JSON(response.result.value!)
                
                print(futureJSON)
                
                self.updatePriceData(json: futureJSON)
                self.updateFutureDateData(json: futureJSON)
                
            } else {
                
                print("Error: \(String(describing: response.result.error))")
                self.MaxPrice.text = "Error"
                self.drawDate.text = "Error"
            }
        }
        
    }
    
    func getPastData (url: String) {
        
        Alamofire.request(url, method: .get).responseJSON { response in
            if response.result.isSuccess {
                
                print("Sucess! Got data")
                
                let pastJSON : JSON = JSON(response.result.value!)
                
                print(pastJSON)
                
                self.updateOldDateData(json: pastJSON)
                self.updateNumbersData(json: pastJSON)
                
            } else {
                
                print("Error: \(String(describing: response.result.error))")
                self.lastDraw.text = "Error"
                self.winners.text = "Error"
            }
        }
        
    }
    
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //TODO: Parse JSON Data
    
    
    func updatePriceData(json : JSON){
        
        if let price = json[jackpot].string {
            
            MaxPrice.text =  price
            
            print(price)
            
        } else {
            MaxPrice.text = "Error"
        }
    }
    
    
    
    func updateFutureDateData(json : JSON){
        
        if let date = json[futureDraw].string {
            
            drawDate.text = date
            
            print(date)
            
        } else {
            drawDate.text = "Error"
        }
    }
    
    
    func updateOldDateData(json : JSON){
        
        if let date = json[draw].string {
            
            lastDraw.text = date
            
            print(date)
            
        } else {
            lastDraw.text = "Error"
        }
    }
    
    func updateNumbersData(json : JSON){
        
        if let winningNumbers = json[results].string {
            
            winners.text = winningNumbers
            
            print(winningNumbers)
            
        } else {
            winners.text = "Error"
        }
    }
}
