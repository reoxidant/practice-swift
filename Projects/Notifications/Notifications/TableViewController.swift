//
//  ViewController.swift
//  Notifications
//
//  Created by Виталий Шаповалов on 05.02.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    let notifications = Notifications()

    let notificationsType = ["Local Notification",
                         "Local Notification with Action",
                         "Local Notification with Content",
                         "Push Notification with  APNs",
                         "Push Notification with Firebase",
                         "Push Notification with Content"]

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationsType.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = notificationsType[indexPath.row]
        
        return cell
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let notificationType = notificationsType[indexPath.row]
        
        let alert = UIAlertController(title: notificationType,
                                      message: "After 5 seconds " + notificationType + " will appear",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.notifications.scheduleNotification(notificationType: notificationType)
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

