//
//  CollectionViewCell.swift
//  HttpRequests
//
//  Created by Виталий Шаповалов on 23.11.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    func configure(album: Album) {
        label.text = album.title
        
        indicator.startAnimating()
        DispatchQueue.global().async { [weak self] in
            if let url = URL(string: album.url),
               let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.imageView.image = image
                    self?.indicator.stopAnimating()
                }
            }
        }
    }
}
