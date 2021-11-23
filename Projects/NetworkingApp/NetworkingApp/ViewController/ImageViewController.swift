//
//  ImageViewController.swift
//  NetworkingApp
//
//  Created by Виталий Шаповалов on 22.11.2021.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndication: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        activityIndication.startAnimating()
        activityIndication.hidesWhenStopped = true
        fetchImage()
    }
    
    private func fetchImage() {
        
        guard let url = URL(string: URLExample.imageURL.rawValue) else { return }

        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            
            if let error = error {
                print(error)
                return
            }
            
            if let response = response {
                print(response)
            }
            
            if let data = data, let image = UIImage.init(data: data) {
                DispatchQueue.main.async {
                    self?.imageView.image = image
                    self?.activityIndication.stopAnimating()
                }
            }
        }.resume()
    }
}
