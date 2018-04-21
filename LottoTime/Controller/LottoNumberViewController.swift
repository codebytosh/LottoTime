//
//  Lotto649ViewController.swift
//  LottoTime
//
//  Created by Shanthosh Pushparajah on 2018-04-20.
//  Copyright © 2018 Shanthosh Pushparajah. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class LottoNumberViewController: UIViewController {
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //TODO: API and Variables
    
    let futureURL = "https://www.magayo.com/api/jackpot.php?api_key=fuPBjPF9sGzrLYnrFa&game=ca_lotto_649"
    
    let pastURL = "https://www.magayo.com/api/results.php?api_key=fuPBjPF9sGzrLYnrFa&game=ca_lotto_649"
    
    var jackpot = "jackpot"
    var futureDraw = "next_draw"
    var draw = "draw"
    var results = "results"
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //TODO: Setup IBOutlets
    
    @IBOutlet weak var lottoPrice: UILabel!
    @IBOutlet weak var newDate: UILabel!
    @IBOutlet weak var oldDate: UILabel!
    @IBOutlet weak var numbers: UILabel!
    
    
    
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
                self.lottoPrice.text = "Error"
                self.newDate.text = "Error"
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
                self.oldDate.text = "Error"
                self.numbers.text = "Error"
            }
        }
        
    }
    
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //TODO: Parse JSON Data
    
    
    func updatePriceData(json : JSON){
        
        if let price = json[jackpot].string {
            
            lottoPrice.text =  price
            
            print(price)
            
        } else {
            lottoPrice.text = "Error"
        }
    }
    
    
    
    func updateFutureDateData(json : JSON){
        
        if let date = json[futureDraw].string {
            
            newDate.text = date
            
            print(date)
            
        } else {
            newDate.text = "Error"
        }
    }
    
    
    func updateOldDateData(json : JSON){
        
        if let date = json[draw].string {
            
            oldDate.text = date
            
            print(date)
            
        } else {
            oldDate.text = "Error"
        }
    }
    
    func updateNumbersData(json : JSON){
        
        if let winningNumbers = json[results].string {
            
            numbers.text = winningNumbers
            
            print(winningNumbers)
            
        } else {
            numbers.text = "Error"
        }
    }
    
    
}





















