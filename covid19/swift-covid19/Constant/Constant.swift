//
//  Constant.swift
//  swift-covid19
//
//  Created by Виталий Шаповалов on 04.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import Foundation

class Constant {
    
    static let BASE_URL = "https://api.covid19api.com/"
    
    static func getRequestURL(endPoint: String) -> String {
        return BASE_URL + endPoint
    }
}
