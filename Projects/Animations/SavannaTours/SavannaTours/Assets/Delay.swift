//
//  Delay.swift
//  SavannaTours
//
//  Created by vshapovalov on 26.02.2022.
//  Copyright © 2022 Razeware LLC. All rights reserved.
//

import Foundation

func delay(seconds: TimeInterval, block: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: block)
}
