//
//  ViewController.swift
//  NotificationObserverExample
//
//  Created by Remi Robert on 19/09/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit
import NotificationObserver

class ViewController: UIViewController {

    private var obs: NotificationObserver!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let not = Notification<String>(name: "uuid")
        
//        self.obs = NotificationObserver(notification: notification, block: { uuid in
//            guard let uuid = uuid else {
//                return
//            }
//            print("uuid : \(uuid)")
//        })
        
//        post(to: not, UUID().uuidString)
    }
}

