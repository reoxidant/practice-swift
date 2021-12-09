//
//  TextFieldColorView.swift
//  SliderColorsSwiftUI
//
//  Created by Виталий Шаповалов on 08.12.2021.
//

import SwiftUI

struct TextFieldColorView: View {
    
    @Binding var text: String
    @Binding var currentValue: Double
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        TextField("", text: $text, onCommit: validateField)
        .disableAutocorrection(true)
        .textFieldStyle(.roundedBorder)
        .frame(width: 60)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text("Wrong value format!")
            )
        }
    }
}

extension TextFieldColorView {
    private func validateField() {
        guard let value = Double("\(text)"), value <= 255.0 else {
            showAlert.toggle()
            text = "\(lround(currentValue))"
            return
        }
        
        currentValue = value
    }
}

struct TextFieldColorView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldColorView(text: .constant(""), currentValue: .constant(0))
    }
}
