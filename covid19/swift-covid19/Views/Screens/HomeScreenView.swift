//
//  HomeView.swift
//  swift-covid19
//
//  Created by Виталий Шаповалов on 31.08.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import SwiftUI

struct HomeScreenView: View {
    
    @EnvironmentObject var caseSummary: CaseSummaryViewModel
    
    var body: some View {
        
        let confirmedCase = self.caseSummary.caseSummary?.Global.TotalConfirmed ?? 0
        
        return NavigationView {
            GeometryReader{ geometry in
                ScrollView(.vertical, showsIndicators: false){
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("LightViolet"))
                            .frame(width: geometry.size.width - 20, height: 170)
                        VStack(alignment: .leading, spacing: 5){
                            Text("Ты плохо себя чувствуешь?")
                                .bold()
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                            Text("Если у тебя есть симптомы Covid 19, пожалуйста немедленно обратитесь за медицинской помощью")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button(action: {}){
                                Text("Обратиться сейчас")
                                    .bold()
                                    .padding([.top, .bottom], 10)
                                    .padding([.leading, .trailing], 30)
                                    .background(Color.white)
                                    .cornerRadius(40)
                                    .foregroundColor(.black)
                            }
                            
                        }
                        .padding([.leading, .trailing], 10)
                        .padding([.top, .bottom], 20)
                    }
                    SymptomView()
                        .padding(.top, 20)
                    
                    PreventionView()
                        .padding(.top, 20)
                    
                    CaseOverviewView(frameWidth: geometry.size.width - 40, confirmedCase: confirmedCase)
                        .padding(.top, 20)
                    
                    ScreeningView()
                        .padding(.top, 30)

                    DonoteNowView()
                        .padding(.top, 10)
                    
                }
                .padding([.leading, .trailing], 10)
                .frame(width: geometry.size.width)
            }
            .navigationBarTitle("Covid 19", displayMode: .automatic)
            .onAppear{
                self.caseSummary.getCaseSummary(url: "summary")
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView().environmentObject(CaseSummaryViewModel())
    }
}
