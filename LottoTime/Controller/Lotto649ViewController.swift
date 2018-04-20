//
//  Lotto649ViewController.swift
//  LottoTime
//
//  Created by Shanthosh Pushparajah on 2018-04-20.
//  Copyright © 2018 Shanthosh Pushparajah. All rights reserved.
//

import Foundation
import UIKit

class Lotto649ViewController: UIViewController {
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //TODO: API and Variables
    
    let futureURL = "https://www.magayo.com/api/jackpot.php?api_key=fnx9TYfC7kHd47qmBJ&game=ca_lotto_649"
    
    let pastURL = "https://www.magayo.com/api/results.php?api_key=fnx9TYfC7kHd47qmBJ&game=ca_lotto_649"
    
    var jackpot = ""
    var futureDraw = ""
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //TODO: Setup IBOutlets
    
    @IBOutlet weak var priceTag: UILabel!
    @IBOutlet weak var winningNumbersTag: UILabel!
    @IBOutlet weak var nextDraw: UILabel!
    @IBOutlet weak var lastDraw: UILabel!
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //TODO: Overide
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
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
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //TODO: Parse JSON Data
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
