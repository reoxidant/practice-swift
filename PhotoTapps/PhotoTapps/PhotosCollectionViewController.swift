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

    let photos = ["cat1", "cat2", "cat3", "cat4", "cat5", "cat6", "cat7", "cat8", "cat9", "cat10", "cat11", "cat12", "cat13", "cat14", "cat15", "cat16", "cat17", "cat18", "cat19", "cat20", "cat21", "cat22", "cat23", "cat24", "cat25", "cat26", "cat27", "cat28", "cat29", "cat30", "cat31", "cat32", "cat33", "cat34", "cat35", "cat36", "cat37", "cat38", "cat39", "cat40", "cat41", "cat42", "cat43", "cat44", "cat45", "cat46", "cat47", "cat48", "cat49", "cat50"]
    
    var shuffledPhotos = Array<String>()
    
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
        
        shuffledPhotos = photos.shuffled()
        
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionViewCell
        
        //MARK: Configure the cell
        
        let imageName = shuffledPhotos[indexPath.row]
        
        cell.catImageView.image = UIImage(named: imageName)
        
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
