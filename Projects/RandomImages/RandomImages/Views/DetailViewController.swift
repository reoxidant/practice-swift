//
//  DetailViewController.swift
//  RandomImages
//
//  Created by Виталий Шаповалов on 25.11.2021.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupView()
    }
    
    private func setupView() {
        
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints({ (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leadingMargin)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailingMargin)
        })
    }
}
