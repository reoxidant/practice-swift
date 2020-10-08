//
//  CaseSummaryService.swift
//  swift-covid19
//
//  Created by Виталий Шаповалов on 04.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import Foundation

class CaseSummaryService{
    
    static func fetchCaseSummary(url: String, completion: @escaping (CaseSummary?) -> ()){
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
        
            let responseData = try? JSONDecoder().decode(CaseSummary.self, from: data)
            
            if let caseSummaryResponse = responseData {
                completion(caseSummaryResponse)
                return
            }
            
            completion(nil)
            return
        }.resume()
    }
    
    static func fetchCaseSummaryByCountry(url: String, completion: @escaping ([CaseDetailByCountry]?) -> ()) {
        guard let url = URL(string: url) else{
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let responseData = try? JSONDecoder().decode([CaseDetailByCountry].self, from: data)
            
            if let caseSummaryByCountryData = responseData {
                completion(caseSummaryByCountryData)
                return
            }
            
            completion(nil)
            return
        }.resume()
    }
}
