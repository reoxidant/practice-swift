//
//  ShapesView.swift
//  AwardsCollectionApp
//
//  Created by Виталий Шаповалов on 14.12.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import SwiftUI

struct ShapesView: View {
    
    let awards = Award.getAwards()
//    let columns = [GridItem(.adaptive(minimum: 160, maximum: 200))]
    
    var activeAwards: [Award] {
        awards.filter { $0.awarded }
    }
    
    var body: some View {
        NavigationView {
//            VStack {
//                ScrollView {
//                    GradientRectangles(width: 250, height: 250)
//                    PathView(width: 250, height: 250)
//                    CurvesView(width: 250, height: 250)
//                    SunView(width: 250, height: 250)
//                }
//            }
            
            CustomGridView(items: activeAwards, columns: 2) { itemSize, award in
                VStack {
                    award.awardView
                    Text(award.title)
                }
                .padding()
                .frame(width: itemSize, height: itemSize)
            }
//            ScrollView {
//                LazyVGrid(columns: columns) {
//                    ForEach(activeAwards, id: \.title) { award in
//                        VStack {
//                            award.awardView
//                            Text(award.title)
//                        }
//                    }
//                }
//            }
            .navigationBarTitle("Your awards: \(activeAwards.count)")
        }
    }
}

struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        ShapesView()
    }
}
