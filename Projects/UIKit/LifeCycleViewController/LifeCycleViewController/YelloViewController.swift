//
//  ViewController.swift
//  LifeCycleViewController
//
//  Created by Виталий Шаповалов on 16.11.2021.
//

import UIKit

class YellowViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    
    var someProperties: String!
    
    var button = UIButton()
    
    lazy var label = UILabel()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // init custom UIButton() view
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func loadView() {
        super.loadView()
        // UIViewController view initialized
        
        printCalledFunction()
    }
    
    // Срабатывает после загрузки view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "YellowVC"
        
        // init nextButton
        // lazy used when you call, now it's nil
        
        printCalledFunction()
    }
    
    // Срабатывает перед появление вью на экране
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        printCalledFunction()
        
        let red = CGFloat.random(in: 0...255)
        let green = CGFloat.random(in: 0...255)
        let blue = CGFloat.random(in: 0...255)
        
        view.backgroundColor = UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
    
    // Вызывается при расстановке констрейнтов
    
    override func updateViewConstraints() {
        printCalledFunction()
        
        // Сначало изменяете что-то, а потом только произойдет обновление / расстановка констрейнтов
        
        super.updateViewConstraints()
    }
    
    // Срабатывает перед тем, как размер вью применяется под размер экрана
    
    override func viewWillLayoutSubviews() {
        
        // Определяет пропорции вью в зависимости от размера экрана
        printCalledFunction()
    }
    
    // Тут идет расчет Auto-Layout
    
    // Срабатывает после того, как размер вью изменился под размер экрана
    
    override func viewDidLayoutSubviews() {
        printCalledFunction()
    }
    
    // Срабатывает после появления вью на экране
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        printCalledFunction()
    }
    
    // Срабатывает при повороте экрана
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        printCalledFunction()
    }
    
    // Срабатывает перед тем, как вью закроется
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        printCalledFunction()
    }
    
    
    // Срабатывает после закрытия вью
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        printCalledFunction()
    }
    
    deinit {
        printCalledFunction()
    }
}

extension UIViewController {
    func printCalledFunction(function: String = #function) {
        print("\(title ?? ""): \(function)")
    }
}

