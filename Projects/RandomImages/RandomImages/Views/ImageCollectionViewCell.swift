//
//  ImageCollectionViewCell.swift
//  RandomImages
//
//  Created by Виталий Шаповалов on 25.11.2021.
//

import UIKit
import SnapKit

class ImageCollectionViewCell: UICollectionViewCell {

    static let identifier = "cell"

    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .gray
        activityIndicator.style = .large
        return activityIndicator
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        setupCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        addSubview(imageView)
        addSubview(activityIndicator)
        
        imageView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
        
        activityIndicator.snp.makeConstraints({
            $0.edges.centerY.equalToSuperview()
            $0.edges.centerX.equalToSuperview()
        })
    }
}
