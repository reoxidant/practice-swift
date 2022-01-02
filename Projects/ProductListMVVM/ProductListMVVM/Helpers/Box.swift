//
//  Box.swift
//  ProductListMVVM
//
//  Created by Виталий Шаповалов on 01.01.2022.
//


class Box<T> {
    var completion: ((T) -> Void)?
    
    var value: T {
        didSet {
            completion?(value)
        }
    }
    
    init(value: T){
        self.value = value
    }
    
    func bind(completion: @escaping (T) -> Void) {
        self.completion = completion
        completion(value)
    }
}
