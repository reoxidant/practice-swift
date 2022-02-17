//
//  ViewController.swift
//  Clubhouse
//
//  Created by Виталий Шаповалов on 13.02.2022.
//

import SnapKit
import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let extraLabel = UILabel()
    let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 241/255, green: 238/255, blue: 228/255, alpha: 1)
        
        view.addSubview(label)
        view.addSubview(extraLabel)
        view.addSubview(button)
        
        setupLabel()
        setupExtraLabel()
        setupButton()
    }
    
    private func setupLabel() {
        label.text = "🎉 Welcome!"
        label.font = UIFont.systemFont(ofSize: 20)
        
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(150)
        }
    }
    
    private func setupExtraLabel() {
        extraLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        extraLabel.font = UIFont.systemFont(ofSize: 18)
        extraLabel.numberOfLines = 0
        
        extraLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(50)
            make.top.equalTo(label).inset(50)
        }
    }
    
    private func setupButton() {
        button.backgroundColor = UIColor(red: 84/255, green: 118/255, blue: 171/255, alpha: 1)
        button.setTitle("Get your username ->", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 18
        button.setTitleColor(.white, for: .normal)
        
        button.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(50)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(30)
        }
    }

}

