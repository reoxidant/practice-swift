//
//  NewEmojiTableViewController.swift
//  EmojiReader
//
//  Created by Виталий Шаповалов on 29.11.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {
    
    @IBOutlet weak var emojiTF: UITextField!
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func textChange(_ sender: UITextField) {
        updateSaveButton()
    }
    
    var emoji = Emoji(emoji: "", title: "", description: "", isFavourite: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButton()
        updateUI()
    }
    
    private func updateUI(){
        emojiTF.text = emoji.emoji
        titleTF.text = emoji.title
        descriptionTF.text = emoji.description
    }
    
    func updateSaveButton(){
        let emoji = emojiTF.text ?? ""
        let title = titleTF.text ?? ""
        let description = descriptionTF.text ?? ""
        
        saveButton.isEnabled = !emoji.isEmpty && !title.isEmpty && !description.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else {return}
        let emoji = emojiTF.text ?? ""
        let title = titleTF.text ?? ""
        let description = descriptionTF.text ?? ""
        
        self.emoji = Emoji(emoji: emoji, title: title, description: description, isFavourite: self.emoji.isFavourite)
    }
}
