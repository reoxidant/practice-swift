//
//  AdaptivePresentationViewController.swift
//  autolayout-practice
//
//  Created by Виталий Шаповалов on 16.11.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class AdaptivePresentationViewController: UIViewController{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        modalPresentationStyle = .popover
        popoverPresentationController?.delegate = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissModal))
    }
    
    @objc func dismissModal(){
        dismiss(animated: true)
    }
}

extension AdaptivePresentationViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) ->
        UIModalPresentationStyle {
            switch (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
            case (.compact, .compact):
                return .fullScreen
            case (.regular, .regular):
                return .formSheet
            default:
                return .none
            }
        }
    func presentationController(_ controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        return UINavigationController(rootViewController: controller.presentedViewController)
    }
}
