//
//  ViewController.swift
//  TrackList
//
//  Created by Виталий Шаповалов on 10.11.2021.
//

import UIKit

class TrackListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var trackList = Track.getTrackList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = tableView.indexPathForSelectedRow, let trackVC = segue.destination as? TrackDetailsViewController {
            trackVC.track = trackList[indexPath.row]
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        tableView.setEditing(editing, animated: true)
    }
}

extension TrackListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trackList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let track = trackList[indexPath.row]
        cell.textLabel?.text = track.song
        cell.detailTextLabel?.text = track.artist
        cell.imageView?.image = UIImage(named: track.track)
        
        return cell
    }
}

extension TrackListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentCell = trackList.remove(at: sourceIndexPath.row)
        trackList.insert(currentCell, at: destinationIndexPath.row)
    }
}
