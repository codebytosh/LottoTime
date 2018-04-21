//
//  Lotto View Controller.swift
//  LottoTime
//
//  Created by Shanthosh Pushparajah on 2018-04-20.
//  Copyright © 2018 Shanthosh Pushparajah. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class LottoViewController: UIViewController {
    
    let dailyNotification : Int = 86400
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //TODO: Overide
    
    override func viewDidLoad() {
        super.viewDidLoad()
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
                
                if error != nil {
                    print("Authorization Unsuccessfull")
                } else {
                    print("Authorization successfull")
                }
            }
        }
    
    
    @IBAction func btnPressed(_ sender: UIButton) {
    
        timedNotifications(inSeconds: TimeInterval(dailyNotification)) { (success) in
            if success {
                print("Success")
            }
        }
  }

func timedNotifications (inSeconds : TimeInterval, completion: @escaping (_ Sender: Bool) -> ()) {
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: true)

        let content = UNMutableNotificationContent()

        content.title = "Daily Check"
        content.subtitle = "Check Nation Wide Lottery"
        content.body = "Check out 'Lotto Time', it may change your life"

        let request = UNNotificationRequest(identifier: "customNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if (error != nil) {
                completion(false)
            } else {
                completion(true)
            }
        }
        
    }

}

