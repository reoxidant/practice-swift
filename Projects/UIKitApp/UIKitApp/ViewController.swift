//
//  ViewController.swift
//  UIKitApp
//
//  Created by Виталий Шаповалов on 07.10.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var switchForm: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MARK: Segmented Control
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        // MARK: Label
        
        label.text = ""
        label.font = label.font.withSize(30)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        // MARK: Slider
        
        slider.value = 1
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .blue
        slider.thumbTintColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        label.text = String(Int(slider.value))
        
        // MARK: TextField
        
        textField.backgroundColor = .white
        textField.keyboardType = .numberPad

        
        // MARK: Button
        
        button.layer.cornerRadius = 10
        button.setTitle("Готово", for: .normal)
        
        // MARK: DatePicker
        
        
    }


    @IBAction func segmentedControlAction(sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            label.text = "Выбран сегмент с индексом 0"
                    label.textColor = .red
        case 1:
            label.text = "Выбран сегмент с индексом 1"
            label.textColor = .yellow
        case 2:
            label.text = "Выбран сегмент с индексом 2"
            label.textColor = .green
        default:break
        }
    }
    
    @IBAction func sliderAction(_ sender: Any) {
         label.text = String(Int(slider.value))
    }
    
    @IBAction func mainButtonAction(_ sender: Any) {
        
        guard let text = textField.text, !text.isEmpty else { return }
        label.text = text
    }
    
    @IBAction func datePickerAction(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        
        label.text = dateFormatter.string(from: datePicker.date)
    }
    
    
    @IBAction func toggleElements(_ sender: Any) {
        segmentedControl.isHidden = !switchForm.isOn
        label.isHidden = !switchForm.isOn
        slider.isHidden = !switchForm.isOn
        textField.isHidden = !switchForm.isOn
        button.isHidden = !switchForm.isOn
        datePicker.isHidden = !switchForm.isOn
    }
}

