//
//  TimeCounter.swift
//  TimeCounter
//
//  Created by Виталий Шаповалов on 09.12.2021.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    
    var count = 3
    var buttonTitle = "Start"
    
    private var timer: Timer?
    
    func startTimer() {
        
        if count > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateValue),
                userInfo: nil,
                repeats: true)
        }
        
        buttonDidTapped()
    }
    
    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            buttonTitle = "Start"
            count = 3
        } else {
            buttonTitle = "Wait..."
        }
        
        objectWillChange.send(self)
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func updateValue() {
        if count > 0 {
            count -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
        
        objectWillChange.send(self)
    }
}
