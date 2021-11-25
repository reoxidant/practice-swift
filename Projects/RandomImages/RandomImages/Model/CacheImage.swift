//
//  CacheImage.swift
//  RandomImages
//
//  Created by Виталий Шаповалов on 25.11.2021.
//

import Foundation
import UIKit

class CacheImage {
    
    static let shared = CacheImage()
    
    private lazy var cacheDataSource: NSCache<AnyObject, UIImage> = {
        let cacheDataSource = NSCache<AnyObject, UIImage>()
        return cacheDataSource
    }()
    
    func saveImage(image: UIImage, index: Int) {
        cacheDataSource.setObject(image, forKey: index as AnyObject)
    }
    
    func getImageBy(index: Int) -> UIImage? {
        cacheDataSource.object(forKey: index as AnyObject)
    }
}
