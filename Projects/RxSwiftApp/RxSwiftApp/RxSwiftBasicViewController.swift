//
//  RxSwiftBasicViewController.swift
//  RxSwiftApp
//
//  Created by Виталий Шаповалов on 13.02.2022.
//

import UIKit
import RxCocoa
import RxSwift

class RxSwiftBasicViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        observeStringValue()
//        observeIntSequence()
//        setupPublishSubject()
        
//        setupPublishRelay()
        setupBehaviorRelay()
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
            print("First: \(event)")
        }.disposed(by: disposeBag)
        
        print("Subscribed 1")
        
        publish.onNext("First song")
        
        publish.subscribe { event in
            print("Second: \(event)")
        }.disposed(by: disposeBag)
        
        print("Subscribed 2")
        
        publish.onNext("Second song")
        
        publish.subscribe { event in
            print("Third: \(event)")
        }.disposed(by: disposeBag)
        
        print("Subscribed 3")
        
        publish.onNext("Third song")
    }
    
    private func setupPublishRelay() {
        
        let publish = PublishRelay<String>()
        
        publish.subscribe { event in
            print("First: \(event)")
        }.disposed(by: disposeBag)
        
        print("Subscribed 1")
        
        publish.accept("First song")
        
        publish.subscribe { event in
            print("Second: \(event)")
        }.disposed(by: disposeBag)
        
        print("Subscribed 2")
        
        publish.accept("Second song")
        
        publish.subscribe { event in
            print("Third: \(event)")
        }.disposed(by: disposeBag)
        
        print("Subscribed 3")
        
        publish.accept("Third song")
    }
    
    private func setupBehaviorRelay() {
        let behavior = BehaviorRelay<String>(value: "Intial")
        
        behavior.subscribe { event in
            print("First: \(event)")
        }.disposed(by: disposeBag)
        print("Subscribed 1")
        
        print()
        
        behavior.accept("Scorpions")
        
        print()
        
        behavior
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { event in
            print("Second: \(event)")
        }.disposed(by: disposeBag)
        print("Subscribed 2")
        
        print()
        
        behavior.accept("Deep purple")
    }
}

