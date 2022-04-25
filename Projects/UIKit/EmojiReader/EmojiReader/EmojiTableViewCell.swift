//
//  EmojiTableViewCell.swift
//  EmojiReader
//
//  Created by Виталий Шаповалов on 26.11.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(object: Emoji)
    {
        self.emojiLabel?.text = object.emoji
        self.titleLabel?.text = object.title
        self.descriptionLabel?.text = object.description
    }
}
