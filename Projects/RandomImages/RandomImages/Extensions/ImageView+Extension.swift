//
//  ImageView + Extension.swift
//  RandomImages
//
//  Created by Виталий Шаповалов on 25.11.2021.
//

import UIKit
import Alamofire

extension UIImageView {
    
    func fetchImage(with index: Int, completion: @escaping (Error?) -> Void) {
        
        guard let url = NetworkAPI.images.url else { return }
        
        AF.request(url).response { dataResponse in
            switch dataResponse.result {
            case .success(let data):
                guard let data = data, let image = UIImage(data: data) else { return }
                DispatchQueue.main.async {
                    self.image = image
                }
                
                CacheImage.shared.saveImage(image: image, index: index)
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
}
