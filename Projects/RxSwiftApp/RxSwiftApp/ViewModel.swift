//
//  ViewModel.swift
//  RxSwiftApp
//
//  Created by Виталий Шаповалов on 16.02.2022.
//

import RxCocoa
import RxSwift

class ViewModel {
    
    var center = BehaviorRelay<CGPoint>(value: .zero)
    var backgroundColor = Observable.just(UIColor.green)
    
    func setup() {
        backgroundColor = center
            .map({ center in
                let red = ((center.x + center.y).truncatingRemainder(dividingBy: 255.0)) / 255.0
                let green: CGFloat = 0.0
                let blue: CGFloat = 0.0
                return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            })
    }
}
