//
//  MapViewController.swift
//  autolayout-practice
//
//  Created by Виталий Шаповалов on 22.10.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

final class MapViewController: UIViewController {
    @IBOutlet weak var desiredXConstraint: NSLayoutConstraint!
    @IBOutlet weak var desiredYConstraint: NSLayoutConstraint!
    @IBOutlet weak var marker: UIView!
    @IBOutlet weak var markerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMarkerToArrowOrX()
    }
    
    func setMarkerToArrowOrX() {
        let currentPoint = marker.frame.origin
        let desiredPoint = CGPoint(x: desiredXConstraint.constant, y:  desiredYConstraint.constant)
        let imageName: String
        let transform: CGAffineTransform
        
        print("currentPoint: \(currentPoint)")
        
        if currentPoint == desiredPoint {
            imageName = "marker-map"
            transform = .identity
        }
        else {
            imageName = "arrow-map"
            transform = CGAffineTransform(rotationAngle: (desiredPoint - currentPoint).angle)
        }

        markerImageView.image = UIImage(named: imageName)
        markerImageView.transform = transform
    }
}

//MARK: UIScrollViewDelegate
extension MapViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_: UIScrollView) {
        setMarkerToArrowOrX()
    }
}

private extension CGPoint {
    var angle: CGFloat {
        return atan2(y, x)
    }
    
    static func - (point0: CGPoint, point1: CGPoint) -> CGPoint {
        return CGPoint(
            x: point0.x - point1.x,
            y: point0.y - point1.y
        )
    }
}
