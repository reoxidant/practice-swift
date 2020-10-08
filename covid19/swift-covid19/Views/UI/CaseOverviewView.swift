//
//  CaseOverviewView.swift
//  swift-covid19
//
//  Created by Виталий Шаповалов on 03.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import SwiftUI

struct CaseOverviewView: View {
    let frameWidth: CGFloat
    let confirmedCase: Int
    
    var body: some View {
        return ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 2)
                .frame(width: self.frameWidth + 10, height: 70)
            
            HStack{
                Image("covid_map")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                
                Spacer()
                
                VStack(alignment: .leading){
                    Text("Колличество заражений")
                        .bold()
                        .foregroundColor(Color("LightViolet"))
                    
                    Text("По всему миру")
                        .font(.system(size: 14))
                    
                    Text("\(self.confirmedCase) подтверждено")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(systemName: "arrow.right")
            }
            .frame(width: self.frameWidth - 10, height: 70)
            .padding(.leading, 20)
        }
    }
}

struct CaseOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        CaseOverviewView(frameWidth: 300, confirmedCase: 0)
    }
}
