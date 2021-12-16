//
//  ContactInfoRow.swift
//  ContactListSwiftUI
//
//  Created by Виталий Шаповалов on 13.12.2021.
//

import SwiftUI

struct ContactInfoRow: View {
    
    let imageName: String
    let rowName: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .foregroundColor(.accentColor)
            Text(rowName)
                .font(.system(size: 18, weight: .regular))
        }
    }
}

struct ContactInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactInfoRow(imageName: "person.fill", rowName: "info")
    }
}
