//
//  Award.swift
//  AwardsCollectionApp
//
//  Created by Виталий Шаповалов on 14.12.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import SwiftUI

struct Award {
    let awardView: AnyView
    let title: String
    let awarded: Bool
    
    static func getAwards() -> [Award] {
        [
            Award(awardView: AnyView(GradientRectangles(width: 160, height: 160)), title: "Gradient Rectangles", awarded: true),
            Award(awardView: AnyView(PathView(width: 160, height: 160)), title: "Path View", awarded: true),
            Award(awardView: AnyView(CurvesView(width: 160, height: 160)), title: "Curves View", awarded: true),
            Award(awardView: AnyView(SunView(width: 160, height: 160)), title: "Sun View", awarded: true)
        ]
    }
}
