//
//  ViewController.swift
//  SliderColors
//
//  Created by Виталий Шаповалов on 11.10.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

protocol ColorViewControllerDelegate: AnyObject {
    var currentColor: UIColor { get }
    func applyNewColor(color: UIColor)
}

class ColorViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    weak var delegate: ColorViewControllerDelegate?
    
    var currentColorValue: UIColor {
        get {
            let redColor = CGFloat(redSlider.value)
            let greenColor = CGFloat(greenSlider.value)
            let blueColor = CGFloat(blueSlider.value)
            
            return UIColor(red: redColor/255, green: greenColor/255, blue: blueColor/255, alpha: 1)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let currentColor = delegate?.currentColor else { return }
        
        colorView.backgroundColor = currentColor
        setSliderValue(by: currentColor)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        colorView.layer.cornerRadius = 10
        
        redSlider.minimumTrackTintColor = .red
        redSlider.maximumTrackTintColor = UIColor.red.withAlphaComponent(0.3)
        greenSlider.minimumTrackTintColor = .green
        greenSlider.maximumTrackTintColor = UIColor.green.withAlphaComponent(0.3)
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.maximumTrackTintColor = UIColor.blue.withAlphaComponent(0.3)
        
        redTextField.delegate = self
        redTextField.keyboardType = .numberPad
        greenTextField.delegate = self
        greenTextField.keyboardType = .numberPad
        blueTextField.delegate = self
        blueTextField.keyboardType = .numberPad
        
        setupToolbar(for: redTextField, greenTextField, blueTextField)
    }
    
    @IBAction func sliderChanged(sender: UISlider) {
        setFieldTextValue(by:sender.tag, textValue: String(Int(sender.value)))
        colorView.backgroundColor = currentColorValue
    }
    
    @IBAction func closeWindow() {
        delegate?.applyNewColor(color: currentColorValue)
        dismiss(animated: true)
    }
    
    @objc private func donePressed() {
        view.endEditing(true)
    }
    
    private func setupToolbar(for textFields: UITextField...){
        
        let toolBar = UIToolbar()
        let flexibleSpaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(donePressed))
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        toolBar.setItems([flexibleSpaceButton, doneButton], animated: false)
        
        textFields.forEach({ textField in
            textField.inputAccessoryView = toolBar
        })
    }
    
    private func setSliderValue(by color: UIColor) {
        
        let ciColor = CIColor(color: color)
        let redValue = 255 * Float(ciColor.red)
        let greenValue = 255 * Float(ciColor.green)
        let blueValue = 255 * Float(ciColor.blue)
        
        setSliderValue(by: redSlider.tag, value: redValue)
        setSliderValue(by: greenSlider.tag, value: greenValue)
        setSliderValue(by: blueSlider.tag, value: blueValue)
        
        setFieldTextValue(by: redSlider.tag, textValue: String(Int(redValue)))
        setFieldTextValue(by: greenSlider.tag, textValue: String(Int(greenValue)))
        setFieldTextValue(by: blueSlider.tag, textValue: String(Int(blueValue)))
    }
    
    private func setSliderValue(by senderTag: Int, value: Float){
        switch senderTag {
        case 0:
            redLabel.text = String(Int(value))
            redSlider.value = value
        case 1:
            greenLabel.text = String(Int(value))
            greenSlider.value = value
        case 2:
            blueLabel.text = String(Int(value))
            blueSlider.value = value
        default: break
        }
    }
    
    private func setFieldTextValue(by senderTag: Int, textValue: String){
        switch senderTag {
        case 0:
            redLabel.text = textValue
            redTextField.text = textValue
        case 1:
            greenLabel.text = textValue
            greenTextField.text = textValue
        case 2:
            blueLabel.text = textValue
            blueTextField.text = textValue
        default: break
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Wrong value format!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
}


extension ColorViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        var value = Float(textField.text ?? "0") ?? 0
        
        if value > 255 {
            value = 255
            showAlert()
        } else if value < 0 {
            value = 0
            showAlert()
        }
        
        textField.text = "\(Int(value))"
        
        setSliderValue(by: textField.tag, value: value)
        
        colorView.backgroundColor = UIColor.init(red: CGFloat(redSlider.value / 255),
                                                 green: CGFloat(greenSlider.value / 255),
                                                 blue: CGFloat(blueSlider.value / 255),
                                                 alpha: 1)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return false
    }
}
