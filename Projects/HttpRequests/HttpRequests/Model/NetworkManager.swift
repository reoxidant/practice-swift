//
//  NetworkManager.swift
//  HttpRequests
//
//  Created by Виталий Шаповалов on 23.11.2021.
//

import Foundation
import UIKit

enum FetchResult {
    case success(albums: [Album])
    case failure(error: Error)
}

struct NetworkManager {

    private let decoder = JSONDecoder()
    private let urlSession = URLSession.shared
    
    func fetchImage(completion: @escaping (FetchResult) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums/1/photos") else {
            return
        }
        
        urlSession.dataTask(with: url) { data, response, error in
            
            var result: FetchResult
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            
            if let error = error {
                print(error.localizedDescription)
                result = .failure(error: error)
                return
            }

            guard let data = data, let albums = try? decoder.decode([Album].self, from: data) else {
                result = .success(albums: [])
                return
            }
            result = .success(albums: albums)
            
        }.resume()
    }
}
