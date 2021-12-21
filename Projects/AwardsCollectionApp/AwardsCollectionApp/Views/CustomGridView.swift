//
//  CustomGridView.swift
//  AwardsCollectionApp
//
//  Created by Виталий Шаповалов on 16.12.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import SwiftUI

struct CustomGridView<Content, T>: View where Content: View{
    
    let items: [T]
    let columns: Int
    let content: (CGFloat, T) -> Content
    
    var rows: Int {
        items.count / columns
    }
    
    var body: some View {
        GeometryReader { geometry in
            let sideSize = geometry.size.width / CGFloat(columns)
            ScrollView {
                VStack {
                    ForEach( 0 ... rows, id: \.self ) { rowIndex in
                        HStack {
                            ForEach( 0 ..< columns ) { columnIndex in
                                if let index = getIndexBy(row: rowIndex, column: columnIndex) {
                                    content(sideSize, items[index])
                                } else {
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func getIndexBy(row: Int, column: Int) -> Int? {
        let index = row * columns + column
        return index < items.count ? index : nil
    }
}

struct CustomGridView_Previews: PreviewProvider {
    static var previews: some View {
        CustomGridView(items: [1,2,3,4,5,6,7,8,9,10,11,12,13], columns: 4) { itemSize, item in
            Text("\(item)")
                .frame(width: itemSize, height: itemSize)
        }
    }
}
