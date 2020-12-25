//
//  PhotosCollectionViewController.swift
//  PhotoTapps
//
//  Created by Виталий Шаповалов on 23.12.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    //MARK: Define UICollectionViewFlowLayout main properties for using while creating collectionView	
    
    let itemsAtRow:CGFloat = 2
    let insertEdges = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Define UICollectionViewFlowLayout as another way that u will be display CollectionView elements
        
        //        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        //        layout.itemSize = CGSize(width: 50, height: 50)
        //        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        //        layout.minimumLineSpacing = 20
        //        layout.minimumInteritemSpacing = 20
        //        layout.scrollDirection = .horizontal
        
        //MARK: hide all scrolls indicators
        //        collectionView.showsVerticalScrollIndicator = false
        //        collectionView.showsHorizontalScrollIndicator = false
        
    }
    
    // MARK: Default UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 150
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionViewCell
        
        //MARK: Configure the cell
        
        cell.backgroundColor = .black
        
        return cell
    }
}

extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //MARK: Use insertEdges and itemsAtRow class props for building FlowLayout
        let paddingWidthItems = insertEdges.left * (itemsAtRow + 1)
        let allowWidthForCellsAtRow = collectionView.frame.width - paddingWidthItems
        let sizeCell = allowWidthForCellsAtRow / itemsAtRow
        return CGSize(width: sizeCell, height: sizeCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return insertEdges
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return insertEdges.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return insertEdges.left
    }
}
