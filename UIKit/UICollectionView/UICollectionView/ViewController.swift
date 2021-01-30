//
//  ViewController.swift
//  UICollectionView
//
//  Created by Виталий Шаповалов on 30.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct CategoryList {
        let title:String
    }
    
    let data = [
        CategoryList(title: "Попробуй!"),
        CategoryList(title: "Наборы и комбо"),
        CategoryList(title: "Роллы"),
        CategoryList(title: "Запеченые роллы"),
        CategoryList(title: "Wok"),
        CategoryList(title: "Вегатарианские блюда"),
        CategoryList(title: "Суши"),
        CategoryList(title: "Пицца"),
        CategoryList(title: "Салаты и закуски"),
        CategoryList(title: "Супы"),
        CategoryList(title: "Горячее"),
        CategoryList(title: "Десерты и напитки"),
        CategoryList(title: "Дополнительно")
    ]
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 1).isActive = true
        
        	
        collectionView.delegate = self
        collectionView.dataSource = self
    }
        
}

extension ViewController:UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = self.data[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 1, height: 1)
    }
}

class CustomCell: UICollectionViewCell{
    
    var data: CategoryList? {
        didSet{
            guard let data = data else { return }
            label.text = data.title
        }
    }
    
    var label:UILabel{
        let label = UILabel()
        
        return label
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        contentView.addSubview(label)
        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init has not been implemented")
    }
    
}

