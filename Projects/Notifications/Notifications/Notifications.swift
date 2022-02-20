//
//  Notifications.swift
//  Notifications
//
//  Created by Виталий Шаповалов on 15.02.2022.
//

import UIKit
import UserNotifications
import Firebase

class Notifications: NSObject {
    
    // MARK: Firebase
//    let messagingDelegate = Messaging.messaging()
    
    // MARK: Default Notification
    let notificationCenter = UNUserNotificationCenter.current()
    
    func requestAuthorization() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { granted , error in
            print("Permission granted: \(granted)")
            
            guard granted else { return }
            
            self.getNotifocationSettings()
        }
    }
    
    func getNotifocationSettings() {
        notificationCenter.getNotificationSettings { settings in
            print("Notification settings: \(settings)")
            
            guard settings.authorizationStatus == .authorized else { return }
            
            // MARK: APNS
            
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    func scheduleNotification(notificationType: String) {
        let content = UNMutableNotificationContent()
        let userAction = "User Action"
        
        content.title = notificationType
//        content.body = "This is example how to create " + notificationType
        content.body = "Summer time"
        content.sound = UNNotificationSound.default
        content.badge = 1
        content.categoryIdentifier = userAction
        
        /*
        guard let path = Bundle.main.path(forResource: "icon", ofType: "png") else { return }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let attachment = try UNNotificationAttachment(
                identifier: "icon", url: url, options: nil
            )
            
            content.attachments = [attachment]
        } catch {
            print("The attachment coudn't not be loaded")
        }
        */
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let identifier = "Local Notification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.add(request) { error in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
        /*
        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
        let deleteAction = UNNotificationAction(identifier: "Delete", title: "Delete", options: [.destructive])
        let category = UNNotificationCategory(identifier: userAction, actions: [snoozeAction, deleteAction], intentIdentifiers: [], options: [])
        
        notificationCenter.setNotificationCategories([category])
         */
    }
}

extension Notifications: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.notification.request.identifier == "Local Notification" {
            print("Handling notification with the Local Notification Identifier")
        }
        
        switch response.actionIdentifier {
        case UNNotificationDismissActionIdentifier:
            print("Dismiss Action")
        case UNNotificationDefaultActionIdentifier:
            print("Default")
        case "Snooze":
            print("Snooze")
            scheduleNotification(notificationType: "Reminder")
        case "Delete":
            print("Delete")
        default:
            print("Unknown action")
        }
        
        completionHandler()
    }
}

// MARK: Firebase

//extension Notifications: MessagingDelegate {
//    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
//        print("\n Firebase registration token: \(fcmToken)\n")
//    }
//}
