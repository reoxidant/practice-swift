//
//  CountryStatisticScreenView.swift
//  swift-covid19
//
//  Created by Виталий Шаповалов on 06.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import SwiftUI

struct CountryStatisticScreenView: View {
    @EnvironmentObject var caseSummary: CaseSummaryViewModel
    
    var countrySlug: String
    
    var body: some View {
        let selectedCountrySummary: SummaryInfo = self.caseSummary.selectedCountry ?? SummaryInfo.getSingleValue()
        var selectedCaseDetailByCountry: [CaseDetailByCountry] = self.caseSummary.countryCases ?? CaseDetailByCountry.getDefaultValue()
        selectedCaseDetailByCountry = selectedCaseDetailByCountry.suffix(30)
        
        let totalConfirmed = selectedCountrySummary.TotalConfirmed
        let newConfirmed = selectedCountrySummary.NewConfirmed
        let recorved = selectedCountrySummary.TotalRecovered
        let death = selectedCountrySummary.TotalDeaths
        
        return NavigationView{
            GeometryReader{ geometry in
                ScrollView{
                    StatisticsInfoView(
                        totalConfirmed: totalConfirmed,
                        newConfirmed: newConfirmed,
                        recorved: recorved,
                        death: death
                    )
                        .frame(height: 210)
                        .padding(.bottom, 20)
                    
                    ScrollView{
                        HStack{
                            BarGraphView(selectedCaseDetailByCountry: selectedCaseDetailByCountry)
                        }
                    }
                    .frame(width: geometry.size.width)
                }
            }
        }
    }
}

struct CountryStatisticScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CountryStatisticScreenView(countrySlug: "india")
    }
}
