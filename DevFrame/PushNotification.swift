//
//  PushNotification.swift
//  SampleFrameworkSwift
//
//  Created by john j on 08/11/21.
//

import UIKit
import UserNotifications
import FirebaseCore
import FirebaseMessaging

public class PushNotification: NSObject {

    let notificationDelegate = PushDelegate()
    
    public override init() {
        super.init()
        
        FirebaseApp.configure()
    }
    
    public func initFNtfnsAndODExp(withUserName userName: String, password: String, appName: String) {
        
        self.registerForPushNotifications()
    }
    
    public func registerForPushNotifications() {
        UIApplication.shared.registerForRemoteNotifications()
        let center = UNUserNotificationCenter.current()
        center.delegate = notificationDelegate
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            guard error == nil else {
                print("regist fail = \(String(describing: error))")
                return
            }
            if granted {
                print("allow regist")
            } else {
                //Handle user denying permissions..
                print("deny regist")
            }
        }
        UIApplication.shared.registerForRemoteNotifications()
        Messaging.messaging().delegate = notificationDelegate
    }
}
