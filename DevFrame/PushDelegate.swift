//
//  PushDelegate.swift
//  SampleFrameworkSwift
//
//  Created by john j on 08/11/21.
//

import UIKit
import UserNotifications
import FirebaseCore
import FirebaseMessaging

class PushDelegate: NSObject, UNUserNotificationCenterDelegate, MessagingDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print(response.notification)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print(notification)
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("FCM Token: \(fcmToken ?? "")")
    }
    
}
