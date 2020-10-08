//
//  DonoteNowView.swift
//  swift-covid19
//
//  Created by Виталий Шаповалов on 03.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import SwiftUI

struct DonoteNowView: View {
    var body: some View {
        return ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("LightViolet"))
                .frame(width: 380, height: 170)
            
            VStack(alignment: .leading, spacing: 10){
                Text("Фонд по борьбе с короновирусом")
                    .bold()
                    .foregroundColor(.white)
                
                
                Text("Этот фонд поможет остановить распространение вируса и сообщить об его возникновении")
                    .font(.system(size: 14))
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                
                
                Spacer()
                
                HStack{
                    Spacer()
                    Button(action: {
                    }) {
                        Text("Поддержи нас")
                            .bold()
                            .padding([.leading, .trailing], 30)
                            .padding([.top, .bottom], 8)
                            .background(Color.white)
                            .cornerRadius(40)
                            .foregroundColor(.green)
                    }
                }
            }
            .padding([.leading, .trailing], 15)
            .padding([.top, .bottom], 20)
        }
        .frame(width: 350, height: 170)
    }
}

struct DonoteNowView_Previews: PreviewProvider {
    static var previews: some View {
        DonoteNowView()
    }
}
