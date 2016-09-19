//
//  NotificationCenter.swift
//  NotificationCenter
//
//  Created by Remi Robert on 19/09/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import Foundation

public typealias NotificationObserverBlock =  ((Any?) -> ())

public struct Notification<A: Any> {
    public let name: String
}

public func post<A>(to note: Notification<A>, _ value: A?) {
    let center = NotificationCenter.default
    let name = NSNotification.Name(note.name)
    guard let value = value else {
        center.post(name: name, object: nil, userInfo: nil)
        return
    }
    let userInfo = ["value": value]
    center.post(name: name, object: nil, userInfo: userInfo)
}

public class NotificationObserver {
    let observer: NSObjectProtocol
    
    public required init<A>(notification: Notification<A>, block aBlock: @escaping NotificationObserverBlock) {
        let center = NotificationCenter.default
        let name = NSNotification.Name(notification.name)
        
        observer = center.addObserver(forName: name, object: nil, queue: nil) { note in
            guard let value = note.userInfo?["value"] as? A else {
                aBlock(nil)
                return
            }
            aBlock(value)
        }
    }
    
    deinit {
        let center = NotificationCenter.default
        center.removeObserver(observer)
    }
}
