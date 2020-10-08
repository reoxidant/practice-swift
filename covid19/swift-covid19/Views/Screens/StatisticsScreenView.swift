//
//  StatisticsScreenView.swift
//  swift-covid19
//
//  Created by Виталий Шаповалов on 05.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import SwiftUI

struct StatisticsScreenView: View {
    
    @EnvironmentObject var caseSummary: CaseSummaryViewModel
    
    var body: some View {
        let totalConfirmed = self.caseSummary.caseSummary?.Global.TotalConfirmed ?? 0
        let newConfirmed = self.caseSummary.caseSummary?.Global.NewConfirmed ?? 0
        let recorved = self.caseSummary.caseSummary?.Global.TotalRecovered ?? 0
        let death = self.caseSummary.caseSummary?.Global.TotalDeaths ?? 0
        
        return NavigationView{
            GeometryReader { geometry in
                ScrollView {
                    StatisticsInfoView(
                        totalConfirmed: totalConfirmed,
                        newConfirmed: newConfirmed,
                        recorved: recorved,
                        death: death
                    )
                    
                    .frame(height: 210)
                    .padding(.bottom, 20)
                    
                    DonoteNowView()
                }
            }
            .padding(.horizontal, 15)
            .navigationBarTitle("Статистика", displayMode: .automatic)
        }
    }
}

struct StatisticsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsScreenView()
    }
}
