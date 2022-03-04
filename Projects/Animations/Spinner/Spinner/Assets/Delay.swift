//
//  Delay.swift
//  Spinner
//
//  Created by vshapovalov on 03.03.2022.
//  Copyright © 2022 Razeware LLC. All rights reserved.
//

import Foundation

func delay(seconds: TimeInterval, block: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: block)
}
