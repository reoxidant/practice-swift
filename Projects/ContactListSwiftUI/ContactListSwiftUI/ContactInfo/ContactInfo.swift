//
//  ContactInfo.swift
//  ContactListSwiftUI
//
//  Created by Виталий Шаповалов on 13.12.2021.
//

import SwiftUI

struct ContactInfo: View {
    
    let person: Person
    
    var body: some View {
        Form {
            ProfileImage()
            ContactInfoRow(imageName: "phone", rowName: "\(person.phoneNumber)")
            ContactInfoRow(imageName: "tray", rowName: person.email)
        }
        .navigationBarTitle(person.fullName)
    }
}

struct ContactInfo_Previews: PreviewProvider {
    static var previews: some View {
        ContactInfo(person: Person.generatePersons()[0])
    }
}

struct ProfileImage: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
            Spacer()
        }
        .padding()
    }
}
