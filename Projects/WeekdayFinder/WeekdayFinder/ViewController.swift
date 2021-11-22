//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by Виталий Шаповалов on 21.11.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func findDayPressed(_ sender: UIButton) {
        let calendar = Calendar.current
        
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else {return}
        
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        
        guard let date = calendar.date(from: dateComponents) else {return}
        
        let weekday = dateFormatter.string(from: date)
        let weekdayCapitalized = weekday.capitalized
        
        label.text = weekdayCapitalized
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
