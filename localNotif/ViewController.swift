//
//  ViewController.swift
//  localNotif
//
//  Created by Andrew Foster on 5/29/17.
//  Copyright © 2017 Andrii Halabuda. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var goBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {didAlow, Error in
            if didAlow {
                print("Granted!")
            } else {
                print("No permission")
            }
            
        })
        goBtn.layer.cornerRadius = 45
    }


    @IBAction func goBtnTapped(_ sender: UIButton) {
        
        let content = UNMutableNotificationContent()
        content.title = "Go"
        content.subtitle = "Hello"
        content.body = "Some random text"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "Timer done", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

}

