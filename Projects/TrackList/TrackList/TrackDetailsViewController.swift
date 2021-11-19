//
//  TrackDetailsViewController.swift
//  TrackList
//
//  Created by Виталий Шаповалов on 10.11.2021.
//

import UIKit

class TrackDetailsViewController: UIViewController {

    @IBOutlet weak var artImageView: UIImageView!
    
    @IBOutlet weak var trackLabel: UILabel!
    
    var track: Track?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let track = track else { return }

        artImageView.image = UIImage(named: track.track)
        
        trackLabel.text = track.track
    }
}
