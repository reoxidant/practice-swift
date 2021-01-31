//
//  ViewController.swift
//  UICollectionView
//
//  Created by Виталий Шаповалов on 30.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerNib()
        collectionView.allowsMultipleSelection = false
        collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
    }
    
    var reuseIdentifier:String = "CollectionViewCellReuseIdentifier"
    
    var nameForNib: String = "CollectionViewCell"
    
    var names = ["Попробуй!", "Наборы и комбо", "Роллы", "Запеченные роллы", "Wok", "Вегетаринские блюда", "Суши", "Пицца", "Салаты и закуски", "Супы", "Горячее", "Десерты и напитки", "Дополнительно"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func registerNib(){
        let nib = UINib(nibName: nameForNib, bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        if let flowLayout = self.collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        collectionView.showsHorizontalScrollIndicator = false
    }
}

extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectionViewCell{
            let name = names[indexPath.row]
            cell.configureCell(name:name)
            cell.layer.cornerRadius = 10
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1
            if cell.isSelected {
                cell.layer.borderColor = UIColor.clear.cgColor
                labelView.text = name
            }
            
            return cell
        }
    
        return UICollectionViewCell()
    }
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        guard let cell: CollectionViewCell =
            Bundle.main.loadNibNamed(nameForNib, owner: self, options: nil)?.first as? CollectionViewCell else {
                return CGSize.zero
        }
        
        cell.configureCell(name: names[indexPath.row])
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
       
        let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return CGSize(width: size.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell{
            cell.isSelected = true
            self.labelView.text = cell.nameLabel.text
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell {
             cell.isSelected = false
        }
    }
}
