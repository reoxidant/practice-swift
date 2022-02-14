//
//  ViewController.swift
//  RxSwiftApp
//
//  Created by Виталий Шаповалов on 13.02.2022.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        observeStringValue()
//        observeIntSequence()
        
        setupPublishSubject()
    }
    
    private func observeStringValue() {
        let observable = Observable.just("Hello")
        
        _ = observable.subscribe({ event in
            print(event)
        }).disposed(by: disposeBag)
    }
    
    private func observeIntSequence() {
        let array = [1, 1, 1, 2, 3, 3, 3, 3, 4, 6, 6, 6, 8, 9, 3]
        let intSequence = Observable
            .from(array)
            .distinctUntilChanged()
        
        intSequence.subscribe { event in
            print(event)
        }.disposed(by: disposeBag)
    }
    
    private func setupPublishSubject() {
        
        let publish = PublishSubject<String>()
        
        publish.subscribe { event in
            print(event)
        }.disposed(by: disposeBag)
        
        print("Subscribed 1")
        
        publish.onNext("First song")
        
        publish.subscribe { event in
            print(event)
        }.disposed(by: disposeBag)
        
        print("Subscribed 2")
        
        publish.onNext("Second song")
    }
}

