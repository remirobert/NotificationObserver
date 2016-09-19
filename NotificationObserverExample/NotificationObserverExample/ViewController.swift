//
//  ViewController.swift
//  NotificationObserverExample
//
//  Created by Remi Robert on 19/09/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit
import NotificationObserver

enum NotificationApp {
    case Name(name: String)
    case UUID
}

extension NotificationApp: NotificationProtocol {
    var name: String {
        get {
            switch self {
            case .Name:
                return "name"
            case .UUID:
                return "uuid"
            }
        }
    }
}

class ViewController: UIViewController {

    private var obs: NotificationObserver<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.obs = NotificationObserver(notification: NotificationApp.UUID, block: { uuid in
            print("suuid : \(uuid)")
        })
        NotificationApp.UUID.post("ok")
    }
}

