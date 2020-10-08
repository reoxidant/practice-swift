//
//  ContryListScreenView.swift
//  swift-covid19
//
//  Created by Виталий Шаповалов on 05.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import SwiftUI

struct ContryListScreenView: View {
    
    @EnvironmentObject var caseSummary: CaseSummaryViewModel
    @State var isCountryDetailShow: Bool = false
    @State var selectedCountry: String = ""
    
    var body: some View {
        
        let summaryData = self.caseSummary.caseSummary?.Countries ?? SummaryInfo.getDefaultValue()
        
        return NavigationView{
            GeometryReader { geometry in
                List{
                    ForEach(summaryData, id: \.self) { data in
                        HStack {
                            Image(uiImage: UIImage(named: "\(String(describing: data.Slug!))-flag-icon-128") ?? UIImage(named: "india-flag-icon-128")!)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 40)
                            
                            VStack(alignment: .leading){
                                Text("\(data.Country ?? "")")
                                
                                Text("Подтверждено случаев: \(data.TotalConfirmed)")
                                    .font(.system(size: 12))
                            }
                        }.onTapGesture {
                            self.isCountryDetailShow.toggle()
                            self.selectedCountry = data.Slug ?? ""
                        }
                    }
                }
                .sheet(isPresented: self.$isCountryDetailShow){
                    CountryStatisticScreenView(countrySlug: self.selectedCountry).environmentObject(self.caseSummary)
                }
            }
        }
        .navigationBarTitle("Country")
    }
}

struct ContryListScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ContryListScreenView()
    }
}
