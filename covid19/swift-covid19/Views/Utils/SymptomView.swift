//
//  SymptomView.swift
//  swift-covid19
//
//  Created by Виталий Шаповалов on 02.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import SwiftUI

struct SymptomView: View {
    
    let symptoms: [Symptom] = [
        Symptom(imageName: "symptoms_1", name: "Жар"),
        Symptom(imageName: "symptoms_2", name: "Сухой кашель"),
        Symptom(imageName: "symptoms_3", name: "Головная боль"),
        Symptom(imageName: "symptoms_4", name: "Отдышка")
    ]
    
    var body: some View {
        return VStack(alignment: .leading){
            HStack{
                Text("Симптомы:")
                    .bold()
                    .font(.system(size: 20))
                
                Text("Covid 19")
                    .bold()
                    .font(.system(size:20))
                    .foregroundColor(Color("LightViolet"))
            }
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(symptoms, id: \.self) { symptom in
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color("VioletWhite"), .white]), startPoint: .topLeading, endPoint: .bottomTrailing
                                        )
                                )
                                    .foregroundColor(.white)
                                    .frame(width: 80, height: 80)
                                    .shadow(color: .gray, radius: 2)
                                
                                Image(symptom.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                            }
                            .frame(height: 85)
                            .padding(.leading, 5)
                            
                            Text(symptom.name)
                                .bold()
                                .font(.system(size: 14))
                        }
                        .padding(.trailing, 15)
                    }
                }
            }
        }
    }
}

struct SymptomView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomView()
    }
}
