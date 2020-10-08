//
//  ScreeningView.swift
//  swift-covid19
//
//  Created by Виталий Шаповалов on 03.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import SwiftUI

struct ScreeningView: View {
    var body: some View {
        return ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color("VioletWhite"))
                .frame(width:380, height: 150)
            
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    Text("Covid 19 Обследование")
                        .foregroundColor(Color("LightViolet"))
                        .bold()
                    
                    Text("Ты ответишь на несколько вопросов о твоих симптомах, путешествий и контактах с людьми")
                        .foregroundColor(Color("LightViolet"))
                        .font(.system(size: 14))
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                }
                
                Image("nurse")
                    .resizable()
                    .frame(width:110, height: 140)
                    .offset(y: -20)
            }
            .padding(.leading, 15)
        }
    }
}

struct ScreeningView_Previews: PreviewProvider {
    static var previews: some View {
        ScreeningView()
    }
}
