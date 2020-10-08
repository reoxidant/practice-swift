//
//  PreventionView.swift
//  swift-covid19
//
//  Created by Виталий Шаповалов on 02.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import SwiftUI

struct PreventionView: View {
    
    let preventionArray:[Prevention] = [
        Prevention(imageName: "prevention_1", name: "ЧАЩЕ", description: "мойте руки"),
        Prevention(imageName: "prevention_2", name: "ПРИКРЫВАЙ", description: "рот при кашле"),
        Prevention(imageName: "prevention_3", name: "ВСЕГДА", description: "убирайтесь"),
        Prevention(imageName: "prevention_4", name: "НОСИТЕ", description: "маску")
    ]
    
    var body: some View {
        
        return VStack(alignment: .leading){
            Text("Профилактика")
                .bold()
                .font(.system(size: 20))
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(preventionArray, id: \.self){ preventionItem in
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height: 70)
                                .foregroundColor(.white)
                                .shadow(color: .gray, radius: 2)
                            HStack{
                                Image(preventionItem.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                
                                VStack(alignment: .leading){
                                    Text(preventionItem.name)
                                        .bold()
                                        .foregroundColor(.purple)
                                        .font(.system(size: 13))
                                    
                                    Text(preventionItem.description)
                                        .font(.system(size: 12))
                                }
                            }
                            .frame(width: 145, height: 75)
                            .padding([.horizontal], 15)
                            .cornerRadius(20)
                        }
                        .padding(.leading, 5)
                    }
                    .padding(.trailing, 12)
                }
            }
        }
    }
}

struct PreventionView_Previews: PreviewProvider {
    static var previews: some View {
        PreventionView()
    }
}
