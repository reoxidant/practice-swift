//
//  ContactList.swift
//  ContactListSwiftUI
//
//  Created by Виталий Шаповалов on 13.12.2021.
//

import SwiftUI

struct ContactList: View {
    
    let contacts: [Person]
    
    var body: some View {
        NavigationView {
            List(contacts, id: \.id) { person in
                NavigationLink(destination: ContactInfo(person: person)) {
                    Text("\(person.fullName)")
                }
            }
            .navigationBarTitle("Contact List")
        }
    }
}

struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        ContactList(contacts: Person.generatePersons())
    }
}
