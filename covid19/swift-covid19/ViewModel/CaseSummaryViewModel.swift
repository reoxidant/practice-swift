//
//  CaseSummaryViewModel.swift
//  swift-covid19
//
//  Created by Виталий Шаповалов on 03.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import Foundation

class CaseSummaryViewModel: ObservableObject{
    // MARK: fetch data by url from json or internet
    @Published var caseSummary: CaseSummary?
    @Published var selectedCountry: SummaryInfo?
    @Published var countryCases: [CaseDetailByCountry]?
    
    func getCaseSummary(url: String){
        self.fetchCaseSummary(url: Constant.getRequestURL(endPoint: url))
    }
    
    private func fetchCaseSummary(url: String){
        CaseSummaryService.fetchCaseSummary(url: url) { caseSummary in
            DispatchQueue.main.async{
                if caseSummary != nil {
                    self.caseSummary = caseSummary
                }
            }
        }
    }
    
    private func fetchCaseSummaryByCountry(url: String){
        CaseSummaryService.fetchCaseSummaryByCountry(url: url){ countryCases in
            DispatchQueue.main.async{
                if countryCases != nil{
                    self.countryCases = countryCases
                }
            }
        }
    }
}
