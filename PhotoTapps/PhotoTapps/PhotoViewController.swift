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
    
    @IBAction func shareAction(_ sender: UIButton) {
        
    }
    
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        photoImageView.image = image
    }
    
}
