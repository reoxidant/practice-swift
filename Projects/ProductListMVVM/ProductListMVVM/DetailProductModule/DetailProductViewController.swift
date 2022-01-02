//
//  DetailProductViewController.swift
//  ProductListMVVM
//
//  Created by Виталий Шаповалов on 30.12.2021.
//

import UIKit

class DetailProductViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    var viewModel: DetailProductViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    @IBAction func didTapFavoriteButton() {
        viewModel.didTapFavoriteButton()
    }
}

extension DetailProductViewController {
    
    func setupViews() {
        setFavoriteButton(status: viewModel.isFavorite.value)
        titleLabel.text = viewModel.title
        productDescription.text = viewModel.description
        productCategory.text = viewModel.category
        
        if let data = viewModel.imageData {
            productImage.image = UIImage(data: data)
        } else {
            productImage.image = UIImage(systemName: "person.fill")
        }
        
        viewModel.isFavorite.bind { [weak self] isFavorite in
            self?.setFavoriteButton(status: isFavorite)
        }
    }
    
    func setFavoriteButton(status: Bool) {
        favoriteButton.tintColor = status ? .red : .gray
    }
}
