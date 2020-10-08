//
//  CasesSammary.swift
//  swift-covid19
//
//  Created by Виталий Шаповалов on 03.09.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import Foundation
import Combine

struct SummaryInfo: Codable, Hashable {
    var NewConfirmed: Int
    var TotalConfirmed: Int
    var NewDeaths: Int
    var TotalDeaths: Int
    var NewRecovered: Int
    var TotalRecovered: Int
    var Country: String?
    var Slug: String?
}

struct CaseSummary: Codable, Hashable{
    var Global: SummaryInfo
    var Countries: [SummaryInfo]
}

struct CaseDetailByCountry: Codable, Hashable {
    var Country: String
    var Cases: Int
    var Status: String
    var Date: String
}

extension CaseSummary{
    static func getDefaultValue() -> CaseSummary{
        return CaseSummary(Global: SummaryInfo(NewConfirmed: 0, TotalConfirmed: 0, NewDeaths: 0, TotalDeaths: 0, NewRecovered: 0, TotalRecovered: 0, Country: "country", Slug: "slug"), Countries: [SummaryInfo(NewConfirmed: 0, TotalConfirmed:0, NewDeaths: 0, TotalDeaths: 0, NewRecovered: 0, TotalRecovered: 0, Country: "country", Slug: "slug")])
    }
}

extension SummaryInfo{
    static func getDefaultValue() -> [SummaryInfo]{
        return [
            SummaryInfo(NewConfirmed: 0, TotalConfirmed: 0, NewDeaths: 0, TotalDeaths: 0, NewRecovered: 0, TotalRecovered: 0, Country: "loading...", Slug: "loading..."),
            SummaryInfo(NewConfirmed: 0, TotalConfirmed: 0, NewDeaths: 0, TotalDeaths: 0, NewRecovered: 0, TotalRecovered: 0, Country: "loading...", Slug: "loading...")
        ]
    }
    
    static func getSingleValue() -> SummaryInfo{
        return SummaryInfo(NewConfirmed: 0, TotalConfirmed: 0, NewDeaths: 0, TotalDeaths: 0, NewRecovered: 0, TotalRecovered: 0, Country: "loading...", Slug: "loading...")
    }
}

extension CaseDetailByCountry{
    static func getDefaultValue() -> [CaseDetailByCountry] {
        return [
            CaseDetailByCountry(Country: "Loading...", Cases: 0, Status: "Confirmed", Date: "2020-01-23T00:00:00Z"),
            CaseDetailByCountry(Country: "Loading...", Cases: 0, Status: "Confirmed", Date: "2020-01-23T00:00:00Z")
        ]
    }
    
    static func getSingleValue() -> CaseDetailByCountry{
        return CaseDetailByCountry(Country: "Loading...", Cases: 0, Status: "Confirmed", Date: "2020-01-23T00:00:00Z")
    }
}
