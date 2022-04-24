//
//  TableViewController.swift
//  CacheApp
//
//  Created by Виталий Шаповалов on 22.11.2021.
//

import UIKit
import SDWebImage

class TableViewController: UITableViewController {
    
    lazy var cache: NSCache<AnyObject, UIImage> = {
        let cache = NSCache<AnyObject, UIImage>()
        return cache
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 200
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return  1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 200
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = "\(indexPath.row)"
        
        cell.imageView?.sd_setImage(with: URL(string: "https://picsum.photos/200"), completed: nil)
        
        /*
        if let image = cache.object(forKey: indexPath.row as AnyObject) {
            cell.imageView?.image = image
        } else {
            fetchImage { [weak self] image in
                
                guard let image = image else { return }

                cell.imageView?.image = image
                tableView.reloadRows(at: [indexPath], with: .middle)
                
                self?.cache.setObject(image, forKey: indexPath.row as AnyObject)
            }
        }
        */
        
        return cell
    }
    
    private func fetchImage(completion: @escaping (UIImage?) -> Void) {
        
        guard let url = URL(string: "https://picsum.photos/200") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let imageData = data else { return }
                
                let image = UIImage(data: imageData)
                
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }.resume()
    }
}
