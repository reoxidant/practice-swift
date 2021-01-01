//
//  EmojiTableViewController.swift
//  EmojiReader
//
//  Created by Виталий Шаповалов on 26.11.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    @IBAction func unwindSegue(for segue:UIStoryboardSegue){
        guard segue.identifier == "saveSegue" else {return}
        let sourceVC = segue.source as! NewEmojiTableViewController
        let emoji = sourceVC.emoji
        
        if let selectIndexEmoji = tableView.indexPathForSelectedRow{
            objects[selectIndexEmoji.row] = emoji
            tableView.reloadRows(at: [selectIndexEmoji], with: .fade)
        }else{
            let newIndexPath = IndexPath(row: objects.count, section: 0)
            
            objects.append(emoji)
            tableView.insertRows(at: [newIndexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "editSegue" else {return}
        let indexPath = tableView.indexPathForSelectedRow!
        let emoji = objects[indexPath.row]
        
        let navigationVC = segue.destination as! UINavigationController
        let emojiVC = navigationVC.topViewController as! NewEmojiTableViewController
        emojiVC.emoji = emoji
        emojiVC.title = "Edit Emoji"
    }
    
    var objects = [
        Emoji(emoji: "😙", title: "Kiss", description: "Kiss my love", isFavourite: false),
        Emoji(emoji: "⚽️", title: "Footbal", description: "We are going to play together", isFavourite: false),
        Emoji(emoji: "💻", title: "Macbook", description: "It's very cool device", isFavourite: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.title = "Emoji Reader"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell
        
        let object = objects[indexPath.row]
        cell.set(object: object)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        objects.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedElement = objects.remove(at: sourceIndexPath.row)
        objects.insert(movedElement, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let done = doneAction(at: indexPath)
        let favourite = favouriteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [done, favourite])
    }
    
    func doneAction(at indexPath: IndexPath)->UIContextualAction{
        let action =  UIContextualAction(style: .destructive, title: "Done") { (action, view, completion) in
            self.objects.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.backgroundColor = .systemGreen
        if #available(iOS 13.0, *) {
            action.image = UIImage(systemName: "checkmark.circle")
        } else {
            // Fallback on earlier versions
        }
        return action
    }
    
    func favouriteAction(at indexPath: IndexPath)->UIContextualAction{
        var object = self.objects[indexPath.row]
        let action = UIContextualAction(style: .destructive, title: "Favourite") { (action, view, completion) in
            object.isFavourite = !object.isFavourite
            self.objects[indexPath.row] = object
            completion(true)
        }
        action.backgroundColor = object.isFavourite ? .systemPurple : .systemGray
        if #available(iOS 13.0, *) {
            action.image = UIImage(systemName: "heart")
        } else {
            // Fallback on earlier versions
        }
        return action
    }
}
