//
//  ContentView.swift
//  CatsList
//
//  Created by Виталий Шаповалов on 22.08.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import SwiftUI

struct Cats: Identifiable{
    var id: Int
    let catName, message, imgName: String
}

struct DetailView: View {
    
    var name: String
    var message: String
    var imgName: String
    
    var body: some View {
        
        ZStack {
            Image(imgName)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
                .background(Color.black)
                .opacity(0.7)
            Text(message)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.white)
        }
            
        .navigationBarTitle(Text(name), displayMode: .inline)
    }
}

struct ContentView: View {
    
    let cats: [Cats] = [
        Cats(id: 0, catName: "Кузя", message: "Кузя любит жрать", imgName: "cat1"),
        Cats(id: 1, catName: "Багира", message: "Багира любит рычать", imgName: "cat2"),
        Cats(id: 2, catName: "Алиса", message: "Алиса любит ласки", imgName: "cat3"),
        Cats(id: 3, catName: "Шладкий", message: "Шладкий любит срать", imgName: "cat4"),
        Cats(id: 4, catName: "Пуся", message: "Пуся любит пукать", imgName: "cat5")
    ]
    
    var body: some View {
        NavigationView {
            List(cats) { cat in
                Image(cat.imgName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                NavigationLink(destination: DetailView(name: cat.catName, message: cat.message, imgName: cat.imgName)) {
                    Text(cat.catName)
                }
            }.navigationBarTitle(Text("Котики"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
