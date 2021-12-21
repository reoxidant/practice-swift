//
//  TabViews.swift
//  AwardsCollectionApp
//
//  Created by Виталий Шаповалов on 14.12.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import SwiftUI

struct TabViews: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "rosette")
                    Text("ContentView")
                }
            CustomView()
                .tabItem {
                    Image(systemName: "network")
                    Text("CustomView")
                }
            ShapesView()
                .tabItem {
                    Image(systemName: "pencil.and.outline")
                    Text("Shapes View")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViews()
    }
}
