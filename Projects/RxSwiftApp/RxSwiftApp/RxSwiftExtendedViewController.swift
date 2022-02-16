//
//  RxSwiftExtendedViewController.swift
//  RxSwiftApp
//
//  Created by Виталий Шаповалов on 16.02.2022.
//

import UIKit
import RxCocoa
import RxSwift

class RxSwiftExtendedViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    let viewModel = ViewModel()
    let circle = UIView()
    let disposeBag = DisposeBag()
    
    var panCoord = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.setup()
        configureView()
        
        viewModel
            .backgroundColor
            .subscribe { event in
                self.circle.backgroundColor = event.element
            }
            .disposed(by: disposeBag)
    }
    
    private func configureView() {
        circle.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view.addSubview(circle)
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        circle.addGestureRecognizer(recognizer)
    }
    
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began {
            panCoord = sender.location(in: sender.view)
            print("panCoord: \(panCoord)")
        }
        
        let newCoord: CGPoint = sender.location(in: sender.view)
        let x = newCoord.x - panCoord.x
        let y = newCoord.y - panCoord.y
        
//        print("newCoord: \(newCoord)")
//        print("x: \(x), y: \(y)")
        
        let resultX = circle.center.x + x
        let resultY = circle.center.y + y
        
        print("resultX: \(resultX), resultY: \(resultY)")
        
        circle.center = CGPoint(x: resultX, y: resultY)
        
        viewModel.center.accept(CGPoint(x: resultX, y: resultY))
    }
    
    func setupButtonAction() {
        button
            .rx
            .tap
            .subscribe { _ in
               print("button pressed")
            }
            .disposed(by: disposeBag)
    }
}
