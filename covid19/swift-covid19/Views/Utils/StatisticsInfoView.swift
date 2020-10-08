//
//  StatisticsInfoView.swift
//  swift-covid19
//
//  Created by Виталий Шаповалов on 05.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import SwiftUI

struct StatisticsInfoView: View {
    
    let totalConfirmed: Int
    let newConfirmed: Int
    let recorved: Int
    let death: Int
    
    var body: some View{
        return GeometryReader { geometry in
            VStack(spacing: 10){
                HStack(spacing: 10){
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color("LightBlue"))
                            .frame(width: geometry.size.width / 2 - 10, height: 100)
                            .padding(.leading, 5)
                        
                        VStack(alignment: .leading){
                            Text("Пройдено тестов")
                                .bold()
                                .foregroundColor(Color("TextDarkBlue"))
                                .padding(.bottom, 15)
                            
                            Text("\(self.totalConfirmed)")
                                .font(.system(size: 22))
                                .bold()
                                .foregroundColor(Color("TextDarkBlue"))
                        }
                        .padding(.leading, 0)
                        .foregroundColor(.green)
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color("LightYellow"))
                            .frame(width: geometry.size.width / 2 - 10, height: 100)
                           
                        
                        VStack(alignment: .leading){
                            Text("Заражены")
                                .bold()
                                .foregroundColor(Color("TextDarkYellow"))
                                .padding(.bottom, 10)
                            
                            Text("\(self.newConfirmed)")
                                .font(.system(size: 22))
                                .bold()
                                .foregroundColor(Color("TextDarkYellow"))
                        }
                        .padding(.leading, -60)
                        .foregroundColor(.green)
                    }
                }
                
                HStack(spacing: 10){
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color("LightGreen"))
                            .frame(width: geometry.size.width / 2 - 10, height: 100)
                            .padding(.leading, 5)
                        
                        VStack(alignment: .leading){
                            Text("Выздоровело")
                                .bold()
                                .foregroundColor(Color("TextDarkGreen"))
                                .padding(.bottom, 10)
                            Text("\(self.recorved)")
                                .font(.system(size: 22))
                                .bold()
                                .foregroundColor(Color("TextDarkGreen"))
                        }
                        .padding(.leading, -30)
                        .foregroundColor(.green)
                    }
                    
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color("LightRed"))
                            .frame(width: geometry.size.width / 2 - 10, height: 100)
                        
                        
                        VStack(alignment: .leading){
                            Text("Смертей")
                                .bold()
                                .foregroundColor(Color("TextDarkRed"))
                                .padding(.bottom, 10)
                            
                            Text("\(self.death)")
                                .font(.system(size: 22))
                                .bold()
                                .foregroundColor(Color("TextDarkRed"))
                        }
                        .padding(.leading, -70)
                        .foregroundColor(.green)
                    }
                }
            }
        }
    }
}

struct StatisticsInfoView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsInfoView(totalConfirmed: 0, newConfirmed: 0, recorved: 0, death: 0)
    }
}
