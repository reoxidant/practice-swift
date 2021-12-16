//
//  ContactDetailList.swift
//  ContactListSwiftUI
//
//  Created by Виталий Шаповалов on 13.12.2021.
//

import SwiftUI

struct ContactDetailList: View {
    
    let contacts: [Person]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contacts, id: \.id) { person in
                    Section(header: Text(person.fullName)) {
                        ContactInfoRow(imageName: "phone", rowName: "\(person.phoneNumber)")
                        ContactInfoRow(imageName: "tray", rowName: person.email)
                    }
                }
                .textCase(.none)
            }
            .navigationBarTitle("Contact List")
        }
    }
}

struct ContactDetailList_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailList(contacts: Person.generatePersons())
    }
}
