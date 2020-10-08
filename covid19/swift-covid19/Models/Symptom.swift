//
//  Symptom.swift
//  swift-covid19
//
//  Created by Виталий Шаповалов on 02.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import Foundation

struct Symptom: Hashable{
    var imageName: String
    var name: String
}

struct Prevention: Hashable {
    var imageName: String
    var name: String
    var description: String
}
