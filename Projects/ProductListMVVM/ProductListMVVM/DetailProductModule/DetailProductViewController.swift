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
        setStatusForFavoriteButton()
        titleLabel.text = viewModel.title
        productDescription.text = viewModel.description
        productCategory.text = viewModel.category
        
        if let data = viewModel.imageData {
            productImage.image = UIImage(data: data)
        } else {
            productImage.image = UIImage(systemName: "person.fill")
        }
        
        viewModel.viewModelDidChange = { [weak self] viewModel in
            self?.setStatusForFavoriteButton()
        }
    }
    
    func setStatusForFavoriteButton() {
        favoriteButton.tintColor = viewModel.isFavorite ? .red : .gray
    }
}
