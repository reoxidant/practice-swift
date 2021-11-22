//
//  PhotoViewController.swift
//  PhotoTapps
//
//  Created by Виталий Шаповалов on 28.12.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    var image = UIImage()
    
    @IBAction func shareAction(_ sender: UIButton) {
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityVC.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                 print("Success to load the image!")
            }
        }
        self.present(activityVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        photoImageView.image = image
    }
    
}
