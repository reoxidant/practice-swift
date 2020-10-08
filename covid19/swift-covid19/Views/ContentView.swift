//
//  ContentView.swift
//  swift-covid19
//
//  Created by Виталий Шаповалов on 31.08.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeScreenView()
                .tabItem ({
                    Image(systemName: "house")
                    Text("Главная")
                })
            StatisticsScreenView()
                .tabItem ({
                    Image(systemName: "book")
                    Text("Статистика")
                })
            ContryListScreenView()
                .tabItem ({
                    Image(systemName: "globe")
                    Text("Сводка по странам")
                })
        }
        .accentColor(Color(.purple))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
