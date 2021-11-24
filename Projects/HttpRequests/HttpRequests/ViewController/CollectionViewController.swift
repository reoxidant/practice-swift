//
//  CollectionViewController.swift
//  HttpRequests
//
//  Created by Виталий Шаповалов on 23.11.2021.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    private var albums: [Album] = []
    private let network = NetworkManager()
    
    lazy var cacheDataSource: NSCache<AnyObject, UIImage> = {
        let cache = NSCache<AnyObject, UIImage>()
        return cache
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        network.fetchImage(completion: { [weak self] result in
            switch result {
            case .success(let albums):
                self?.albums = albums
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            case .failure(let error):
                self?.showAlert(title: "Error", message: "\(error.localizedDescription)")
            }
        })
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        albums.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        
        let album = albums[indexPath.row]
            
        if let image = cacheDataSource.object(forKey: indexPath.row as AnyObject) {
            cell.imageView.image = image
        } else {
            cell.configure(album: album)
            if let image = cell.imageView.image {
                cacheDataSource.setObject(image, forKey: indexPath.row as AnyObject)
            }
        }
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2 - 20, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
